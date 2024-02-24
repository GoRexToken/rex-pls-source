// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


/*


ABOUT:
https://pls-rex.io/sac/

USE:
https://app.pls-rex.io/


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░                         ░░░░░░
░░░░░░   WELCOME to PLS-REX    ░░░░░░
░░░░░░                         ░░░░░░
░░░░░░    made by Hexicans     ░░░░░░
░░░░░░                         ░░░░░░
░░░░░░  with love and respect  ░░░░░░
░░░░░░   for "Richard Heart"   ░░░░░░
░░░░░░                         ░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

This contract allows sacrificing PLS tokens.
Each sacrifice represents how strong they believe that blockchains are speech and speech is a protected human right.
Sacrificed tokens are gone forever.
There is nothing to get in return.

The contract uses 50% of all sacrificed PLS as sacrifice.
The contract uses 49% of all sacrificed PLS to put them into a liquidity pool, the PLS/REX pair, automatically.
The contract uses 01% of all sacrificed PLS (before first SAC-Tx on DAY 22) to send it to the address that has sacrificed the most PLS before the first SAC-Tx on DAY 22, automatically.

*/


interface IREXToken {
    function currentRxDay() external view returns (uint32);
    function mintAsSubcontract(address account, uint256 amount) external;
    function setInternal(bool inter) external;
    function approve(address spender, uint256 amount) external returns (bool);
    function PAIR() external returns (IUniswapV2Pair);
}

interface IAirdrop {
    function totalClaimedPrincipals() external view returns (uint256);
    function currentBaseClaimRatio() external view returns (uint256);
}

interface IUniswapV2Router02 {
    function WPLS() external pure returns (address);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
}

interface IUniswapV2Pair {
    function token0() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract PlsRexSac {
    uint8 private processing = 1;
    address public highestSacAddress;
    address payable private SAC_ADDR;
    IREXToken public REX_CONTRACT;
    IAirdrop public AIR_CONTRACT;
    IUniswapV2Router02 public constant UNISWAP_ROUTER = IUniswapV2Router02(0x165C3410fC91EF562C50559f7d2289fEbed552d9);
    bool public isRatioSet = false;
    bool public isRexAmountSet = false;
    uint32 public constant SAC_DAYS = 28;
    uint32 public constant LIQUIDITY_DAY = 22;
    uint32 public constant LAST_CLAIM_DAY = 365;
    uint256 public AVAILABLE_REX_SAC;
    uint256 constant HIGH_PRECISION = 100E18;
    uint256 public ratio;
    uint256 public totalSaccedPls;
    uint256 public totalSacAddresses;
    uint256 public totalfetchedREX;
    uint256 public totalfetchedAddresses;
    uint256 public highestSacAmount;
    uint256 public totalPlsLiquidityProvided;
    uint256 public totalRexLiquidityProvided;
    uint256 public startPriceRex;
    uint256 public startPricePls;
    mapping(address => uint256) public addrSacrifice;
    mapping(address => uint256) public addrREXFetched;
    mapping(address => bool) public addrFetched;
    mapping(address => bool) public verbose;

    event PlsSacced(address indexed sender, uint256 amount, uint32 indexed day);
    event Claimed(address indexed receiver, uint256 amount, uint32 indexed day);
    event LiquidityGenerated(uint256 rexAmount, uint256 plsAmount, uint32 day);

    receive() external payable { }
    fallback() external payable { }

    modifier lockTheTx() {
        require(processing == 1, "SAC: processing");
        processing = 0;
        _;
        processing = 1;
    }

    constructor(address _rex, address _air) {
        SAC_ADDR = payable(msg.sender);
        REX_CONTRACT = IREXToken(_rex);
        AIR_CONTRACT = IAirdrop(_air);
    }

    /**
      * @notice An external payable function for a SAC participant to sac PLS during SAC phase
      * @dev Will fail, if SAC-amount=0 or fetched-airdrop=0 (which can't happen, because there WILL BE more than zero participants)
      */
    function sac() external payable lockTheTx {
        require(msg.value >= 1E23, "SAC: Send at least 100,000 PLS");
        require(_notContract(msg.sender), "SAC: Contracts not allowed");
        require(msg.sender == tx.origin, "SAC: Proxy contract not allowed");
        require(_currentRxDay() >= 1, "SAC: Too early");
        require(_currentRxDay() <= SAC_DAYS, "SAC: Too late");

        if(addrSacrifice[msg.sender] == 0) { totalSacAddresses++; }
        addrSacrifice[msg.sender] += msg.value;
        totalSaccedPls += msg.value;

        uint256 sacced = msg.value / 2;  // 50% is sacced, 49% liquidity, 1% for the high-roller
        sendValue(SAC_ADDR, sacced);

        // this part is only called once, with the first Tx on/after LIQUIDITY_DAY
        // it sets the amount of REX for the SAC participants, distributes PLS to the high-roller, fills the pool with initial liquidity
        if(!isRexAmountSet && _currentRxDay() >= LIQUIDITY_DAY) {
            isRexAmountSet = true;

            // the amount of REX the SAC addresses shall get is the double amount of total claimed principals of the AIRDROP addresses
            // then: reduce the airdrop part, according to the rate of people that fetched their airdrop
            // this is to make sure, the airdrop part doesn't get higher than intended, which could happen from late-claimers otherwise
            // technically, the amount of AIRDROPS can't be decreased, so the portion for SAC is increased instead - so the ratio is correct
            // to save variables, the calculation is compressed
            // safemath: CANNOT OVERFLOW, as totalClaimedPrincipals() is max 220B*1E18
            AVAILABLE_REX_SAC = AIR_CONTRACT.totalClaimedPrincipals() / 2;
            AVAILABLE_REX_SAC = (AVAILABLE_REX_SAC * AIR_CONTRACT.currentBaseClaimRatio()) / 1E6;
            AVAILABLE_REX_SAC = (AIR_CONTRACT.totalClaimedPrincipals() * AIR_CONTRACT.totalClaimedPrincipals()) / AVAILABLE_REX_SAC;

            // send the high-roller its 1% of total sacced PLS (until end of day 21)
            uint256 _onePercOfTotalPls = address(this).balance / 50;    // 1% of all PLS equals 1/50 of the remaining 50%
            sendValue(payable(highestSacAddress), _onePercOfTotalPls);  // send

            fillPool();
        }

        // the "highest SAC address" is only calculated BEFORE the LIQUIDITY_DAY, as long as "isRexAmountSet" = false
        if(!isRexAmountSet && addrSacrifice[msg.sender] > highestSacAmount) {
            highestSacAmount = addrSacrifice[msg.sender];
            highestSacAddress = msg.sender;
        }

        emit PlsSacced(msg.sender, msg.value, _currentRxDay());
    }

    /**
      * @notice An external function for a SAC participant to claim REX during claim phase (day 29 to 365)
      */
    function claim() external lockTheTx returns (uint256 _rex)
    {
        require(_notContract(msg.sender), "SAC: Contracts cannot claim");
        require(msg.sender == tx.origin, "SAC: Proxy contract not allowed");
        require(_currentRxDay() > SAC_DAYS, "SAC: Too early");
        require(_currentRxDay() <= LAST_CLAIM_DAY, "SAC: Too late");
        require(addrSacrifice[msg.sender] > 0, "SAC: Nothing to claim");
        require(!addrFetched[msg.sender], "SAC: Already claimed");

        addrFetched[msg.sender] = true;

        if(!isRatioSet) {
            isRatioSet = true;
            ratio = (AVAILABLE_REX_SAC * HIGH_PRECISION) / totalSaccedPls;
            uint256 remainderCheck = (AVAILABLE_REX_SAC * HIGH_PRECISION) % totalSaccedPls;
            ratio = remainderCheck == 0 ? ratio : ratio + 1;
            // use all remaining PLS to extend the pool depth
            if (address(this).balance > 0) { extendPool(); }
            if (address(this).balance > 0) { sendValue(SAC_ADDR, address(this).balance); } // if still any PLS are left, withdraw
        }

        _rex = (addrSacrifice[msg.sender] * ratio) / HIGH_PRECISION;
        addrREXFetched[msg.sender] += _rex;
        totalfetchedAddresses++;
        totalfetchedREX += _rex;
        REX_CONTRACT.mintAsSubcontract(msg.sender, _rex);
        emit Claimed(msg.sender, _rex, _currentRxDay());
    }

    function fillPool() private {
        uint256 _plsAmount = address(this).balance;            // send all remaining PLS as first, forever locked liquidity
        uint256 _rexAmount = (AVAILABLE_REX_SAC * 49) / 100;
        if (_rexAmount >= 1E15) {                              // skip if less than 0.01 PLS would be added, happens if no one participates
            REX_CONTRACT.mintAsSubcontract(address(this), _rexAmount);
            REX_CONTRACT.approve(address(UNISWAP_ROUTER), _rexAmount);
            REX_CONTRACT.setInternal(true);
            (uint256 amountREX, uint256 amountPLS, ) =
            UNISWAP_ROUTER.addLiquidityETH{value: _plsAmount}(address(REX_CONTRACT), _rexAmount, 0, 0, address(0), block.timestamp + 60 seconds);
            REX_CONTRACT.setInternal(false);
            totalPlsLiquidityProvided += amountPLS;
            totalRexLiquidityProvided += amountREX;
            startPriceRex = amountREX;
            startPricePls = amountPLS;
            emit LiquidityGenerated(amountREX, amountPLS, _currentRxDay());
        }
    }

    function extendPool() private {
        uint256 _plsAmount = address(this).balance;                       // send all PLS as liquidity
        IUniswapV2Pair PAIR = REX_CONTRACT.PAIR();                        // get PAIR
        (uint256 reserveIn, uint256 reserveOut, ) = PAIR.getReserves();   // reserveIn COULD be REX, COULD be PLS
        uint256 _rexAmount = PAIR.token0() == UNISWAP_ROUTER.WPLS()
            ? (_plsAmount * reserveOut) / reserveIn
            : (_plsAmount * reserveIn) / reserveOut;
        REX_CONTRACT.mintAsSubcontract(address(this), _rexAmount);        // mint
        REX_CONTRACT.approve(address(UNISWAP_ROUTER), _rexAmount);        // approve router to withdraw REX tokens from here
        REX_CONTRACT.setInternal(true);
        (uint256 amountREX, uint256 amountPLS, ) =
        UNISWAP_ROUTER.addLiquidityETH{value: _plsAmount}(address(REX_CONTRACT), _rexAmount, 0, 0, address(0), block.timestamp + 30 seconds);
        REX_CONTRACT.setInternal(false);
        totalPlsLiquidityProvided += amountPLS;
        totalRexLiquidityProvided += amountREX;
        emit LiquidityGenerated(amountREX, amountPLS, _currentRxDay());
    }

    /**
      * @notice A simple true/false per user that can be used in the front end (instead of cookies)
      */
    function setVerbose(bool val) external
    {
        verbose[msg.sender] = val;
    }

    /**
      * @notice An external function returning the CURRENTLY claimable REX amount for a SAC phase participant
      * @dev Returns 0 after claiming
      */
    function claimable(address who) external view returns (uint256 _rex)
    {
        if(_currentRxDay() > SAC_DAYS
            && _currentRxDay() <= LAST_CLAIM_DAY
            && addrSacrifice[who] > 0
            && !addrFetched[who])
        {
            uint256 _rati = (AVAILABLE_REX_SAC * HIGH_PRECISION) / totalSaccedPls;
            uint256 remainderCheck = (AVAILABLE_REX_SAC * HIGH_PRECISION) % totalSaccedPls;
            _rati = remainderCheck == 0 ? _rati : _rati + 1;
            _rex = (addrSacrifice[who] * _rati) / HIGH_PRECISION;
        }
    }

    function _currentRxDay() public view returns (uint32) {
        return REX_CONTRACT.currentRxDay(); }

    function _notContract(address _addr) internal view returns (bool) {
        uint32 size; assembly { size := extcodesize(_addr) } return (size == 0); }

    function sendValue(address payable recipient, uint256 amount) internal {
        (bool success, ) = recipient.call{value: amount}(''); require(success, "SAC: Failed to send value"); }
}
