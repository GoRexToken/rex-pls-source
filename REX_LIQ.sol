// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


interface IREXToken {
    function PAIR() external view returns (IUniswapV2Pair);
    function balanceOf(address account) external returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function setInternal(bool inter) external;
    function addSellable(address _account, uint256 _amount) external;
}

interface IUniswapV2Pair {
    function factory() external view returns (address);
    function token0() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function totalSupply() external view returns (uint);
}

interface ISAC {
    function isRexAmountSet() external view returns (bool);
}

interface ITREX {
    function stakedTrex(address _who) external view returns (uint256);
}

interface IUniswapV2Router02 {
    function factory() external pure returns (address);
    function WPLS() external pure returns (address);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
  }

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == _ENTERED;
    }
}

contract PlsRexLiquidity is ReentrancyGuard {

    address public owner;         // for initializing contracts after deployment
    address public SAC_CONTRACT;
    uint256 public totalActiveLiquidityProviders;
    uint256 public totalRexSentToLiquidity;
    uint256 public totalLpTokenBalances;

    ITREX public TREX_TOKEN;
    IUniswapV2Pair public UNISWAP_PAIR;
    IREXToken public REX_CONTRACT;
    IUniswapV2Router02 public constant UNISWAP_ROUTER = IUniswapV2Router02(0x165C3410fC91EF562C50559f7d2289fEbed552d9);

    mapping(address => uint256) public lpTokenBalance;          // the LP TOKEN balance of a user, held in this contract
    mapping(address => uint256) public rexSentToLiquidity;      // the amount of REX, the liquidity provider has sent
    mapping(address => uint256) public lpProvisionTimestamp;    // timestamp of liquidity provision / if == 0 -> no provider
    mapping(address => uint256) public lpProvisionTrex;         // number of staked TREX when providing liquidity (more sellable amount)
    mapping(address => uint256) public sellableRexClaimed;      // the SELLABLE REX claimed already, in the current LP position
    mapping(address => uint256) public sellableRexClaimedEver;  // the SELLABLE REX claimed, from all LP positions ever

    event LiquidityAdded(address sender, uint256 rexAmount, uint256 plsAmount);
    event LiquidityRemoved(address receiver, uint256 rexAmount, uint256 plsAmount);
    event SellableRexReceived(address sender, uint256 rexAmount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyTokenDefiner() { require(msg.sender == owner, "LIQ: No auth"); _; }

    receive() external payable { require (msg.sender == address(UNISWAP_ROUTER), "LIQ: No direct deposits."); }
    fallback() external payable { revert(); }

    constructor() { owner = msg.sender; }

    function init(address _REX, address _TREX, address _SAC) external onlyTokenDefiner {
        REX_CONTRACT = IREXToken(_REX);
        UNISWAP_PAIR = REX_CONTRACT.PAIR();
        TREX_TOKEN = ITREX(_TREX);
        SAC_CONTRACT = _SAC;
        address previousOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(previousOwner, owner);
    }

    /**
      * @notice A function to allow an investor (not a contract) to provide liquidity to the REX pair
      * MIN LIQUIDIY: 1M PLS
      * @notice The sent PLS determine the REX that will be withdrawn in the course
      * @dev Check "getAddLiquidityRex" before to get the REX amount needed. Approve REX before, on front end.
      * @dev The contract may only hold LP tokens, never REX or PLS
      */
    function addLiquidityToPair() nonReentrant external payable
    {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "LIQ: Invalid sender");
        require(ISAC(SAC_CONTRACT).isRexAmountSet(), "LIQ: No liquid pair yet");
        require(msg.value >= 1E24, "LIQ: Below min");
        require(lpProvisionTimestamp[msg.sender] == 0, "LIQ: Already a provider");

        // for sellable amount calculation
        lpProvisionTimestamp[msg.sender] = block.timestamp;

        // calculate PLS and REX amounts
        uint256 _plsAmount = msg.value;
        (uint256 reserveIn, uint256 reserveOut, ) = UNISWAP_PAIR.getReserves();
        uint256 _rexAmount = UNISWAP_PAIR.token0() == UNISWAP_ROUTER.WPLS()
            ? (_plsAmount * reserveOut) / reserveIn
            : (_plsAmount * reserveIn) / reserveOut;

        // transfer REX from user to this contract
        REX_CONTRACT.setInternal(true);
        require(REX_CONTRACT.transferFrom(msg.sender, address(this), _rexAmount), "LIQ: Transfer of REX failed.");

        // add PLS and REX as liquidity
        REX_CONTRACT.approve(address(UNISWAP_ROUTER), _rexAmount);
        (uint256 amountToken, uint256 amountETH, uint256 liquidity) =
            UNISWAP_ROUTER.addLiquidityETH{value: _plsAmount}(address(REX_CONTRACT), _rexAmount, 0, 0, address(this), block.timestamp + 60 seconds);

        // pay back what's left, if applicable
        uint256 rexBalAfter = REX_CONTRACT.balanceOf(address(this));
        if (rexBalAfter > 0) { REX_CONTRACT.transfer(msg.sender, rexBalAfter); }
        REX_CONTRACT.setInternal(false);
        if (address(this).balance > 0) { sendValue(payable(msg.sender), address(this).balance); }

        // track balances
        lpTokenBalance[msg.sender] = liquidity;
        totalLpTokenBalances += liquidity;
        rexSentToLiquidity[msg.sender] = amountToken;
        totalRexSentToLiquidity += amountToken;
        lpProvisionTrex[msg.sender] = TREX_TOKEN.stakedTrex(msg.sender) > 3 ? 3 : TREX_TOKEN.stakedTrex(msg.sender);
        totalActiveLiquidityProviders++;

        emit LiquidityAdded(msg.sender, amountToken, amountETH);
    }

    /**
      * @notice A function to allow a liquidity provider to withdraw all their liquidity from the REX pair.
      * @notice Transfers all REX and PLS back to the liquidity provider (amounts may have changed due to price changes).
      * @notice Also claims the "sellable REX" amount for the liquidity provider, if applicable.
      */
    function withdrawLiquidityFromPair() nonReentrant external
    {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "LIQ: Invalid sender");

        uint256 userLp = lpTokenBalance[msg.sender];
        require(userLp > 0, "LIQ: No LP token found");

        // check vesting period
        uint256 lapsedWeeks = (((block.timestamp - lpProvisionTimestamp[msg.sender]) / 86400) / 7);
        require(lapsedWeeks >= 12, "LIQ: Too early");

        // check and pay rewards
        uint256 _sellableRex = getClaimableAmount(msg.sender);
        if (_sellableRex > 0) {
            REX_CONTRACT.addSellable(msg.sender, _sellableRex);
            sellableRexClaimedEver[msg.sender] += _sellableRex;
            emit SellableRexReceived(msg.sender, _sellableRex);
        }

        // reset balances
        totalLpTokenBalances = totalLpTokenBalances >= lpTokenBalance[msg.sender] ? totalLpTokenBalances - lpTokenBalance[msg.sender] : 0;
        lpTokenBalance[msg.sender] = 0;       // hard reset
        totalRexSentToLiquidity = totalRexSentToLiquidity >= rexSentToLiquidity[msg.sender] ? totalRexSentToLiquidity - rexSentToLiquidity[msg.sender] : 0;
        rexSentToLiquidity[msg.sender] = 0;
        lpProvisionTimestamp[msg.sender] = 0;
        sellableRexClaimed[msg.sender] = 0;
        totalActiveLiquidityProviders--;

        // remove liquidity
        REX_CONTRACT.setInternal(true);
        (uint256 amountToken, uint256 amountETH) =
            UNISWAP_ROUTER.removeLiquidityETH(address(REX_CONTRACT), userLp, 0, 0, msg.sender, block.timestamp + 30 seconds);
        REX_CONTRACT.setInternal(false);

        emit LiquidityRemoved(msg.sender, amountToken, amountETH);
    }

    /**
      * @notice A function to allow a liquidity provider claiming the SELLABLE REX accrued so far
      * @notice Does not reset the timer, just claims what's claimable in this second
      */
    function claimSellableAmount() external returns (uint256 _sellableRex)
    {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "LIQ: Invalid sender");
        _sellableRex = getClaimableAmount(msg.sender);
        require(_sellableRex > 0, "LIQ: No payout possible");

        sellableRexClaimed[msg.sender] += _sellableRex;
        sellableRexClaimedEver[msg.sender] += _sellableRex;
        REX_CONTRACT.addSellable(msg.sender, _sellableRex);

        emit SellableRexReceived(msg.sender, _sellableRex);
    }

    /**
      * @notice A function to allow the TREX contract to update the status of lpProvisionTrex
      * @notice Claim the provider's SELLABLE REX accrued so far, resets the timer and updates lpProvisionTrex
      */
    function updateTrexStaked(address provider) external
    {
        require(msg.sender == address(TREX_TOKEN), "LIQ: No auth");

        // first, claim sellable amount, if available, based on the TREX stored
        uint256 _sellableRex = getClaimableAmount(provider);
        if (_sellableRex > 0) {
            sellableRexClaimedEver[provider] += _sellableRex;
            REX_CONTRACT.addSellable(provider, _sellableRex);
            emit SellableRexReceived(provider, _sellableRex);
        }

        // update TREX staked variable and reset timer and claimed counter
        lpProvisionTrex[provider] = TREX_TOKEN.stakedTrex(provider) >= 3 ? 3 : TREX_TOKEN.stakedTrex(provider);
        lpProvisionTimestamp[provider] = block.timestamp;   // new "round"
        sellableRexClaimed[provider] = 0;                   // reset claimed for new round
    }

    /**
      * @notice A function returning an account's amount of SELLABLE REX accrued so far
      * where 1.4% of the provided REX are made claimable as SELLABLE REX AMOUNT every fulfilled week with no TREX staked
      * where 1.6% of the provided REX are made claimable as SELLABLE REX AMOUNT every fulfilled week with 1 TREX staked
      * where 1.8% of the provided REX are made claimable as SELLABLE REX AMOUNT every fulfilled week with 2 TREX staked
      * where 2.0% of the provided REX are made claimable as SELLABLE REX AMOUNT every fulfilled week with 3 TREX staked (max)
      */
    function getClaimableAmount(address who) public view returns (uint256 _sellableRexAmount)
    {
        if (lpTokenBalance[who] == 0)  { return 0; }
        if (block.timestamp <= lpProvisionTimestamp[who]) { return 0; }
        uint256 weeksFulfilled = ((block.timestamp - lpProvisionTimestamp[who]) / 86400) / 7;
        uint256 factor = uint256(14) + (lpProvisionTrex[who] * 2);          // 14/1000=1.4% to 20/1000=2%
        _sellableRexAmount = ((rexSentToLiquidity[who] * weeksFulfilled) * factor) / 1000;
        _sellableRexAmount = _sellableRexAmount - sellableRexClaimed[who];  // reduce by what's already claimed
    }

    /**
      * @notice A function to calculate the REX to spend at a given PLS amount (to add as liquidity)
      * @notice And indicating with a bool whether the account has enough tokens to actually provide those amounts of tokens
      */
    function getAddLiquidityRex(uint256 _pls) external returns (uint256 _rex, bool _couldAdd) {
        (uint256 reserveIn, uint256 reserveOut, ) = UNISWAP_PAIR.getReserves();
        _rex = UNISWAP_PAIR.token0() == UNISWAP_ROUTER.WPLS() ? (_pls * reserveOut) / reserveIn : (_pls * reserveIn) / reserveOut;
        _couldAdd = (REX_CONTRACT.balanceOf(msg.sender) >= _rex && address(msg.sender).balance >= _pls);
    }

    /**
      * @notice A function to calculate the PLS to spend at a given REX amount (to add as liquidity)
      * @notice And indicating with a bool whether the account has enough tokens to actually provide those amounts of tokens
      */
    function getAddLiquidityPls(uint256 _rex) external returns (uint256 _pls, bool _couldAdd) {
        (uint256 reserveIn, uint256 reserveOut, ) = UNISWAP_PAIR.getReserves();
        _pls = UNISWAP_PAIR.token0() == UNISWAP_ROUTER.WPLS() ? (_rex * reserveIn) / reserveOut : (_rex * reserveOut) / reserveIn;
        _couldAdd = (REX_CONTRACT.balanceOf(msg.sender) >= _rex && address(msg.sender).balance >= _pls);
    }

    /**
      * @notice For fetching user data for front end
      */
    function userData(address _user) external view returns (uint256[9] memory data) {
        data[0] = lpProvisionTimestamp[_user];
        data[1] = lpTokenBalance[_user];
        data[2] = userPercentageMulTsd(_user);
        data[3] = rexSentToLiquidity[_user];
        data[4] = sellableRexClaimed[_user];
        data[5] = sellableRexClaimedEver[_user];
        data[6] = userNextClaimStamp(_user);
        data[7] = userStampWithdrawable(_user);
        data[8] = lpProvisionTrex[_user];
    }

    function userNextClaimStamp(address _user) public view returns (uint256 stamp) {
        if (lpTokenBalance[_user] > 0) {
          uint256 weeksFulfilled = ((block.timestamp - lpProvisionTimestamp[_user]) / 86400) / 7;
          stamp = lpProvisionTimestamp[_user] + ((weeksFulfilled + 1) * 1 weeks);
        }
    }

    function userStampWithdrawable(address _user) public view returns (uint256 stamp) {
        if (lpTokenBalance[_user] > 0) { stamp = lpProvisionTimestamp[_user] + (uint256(12) * 1 weeks); } }

    function userPercentageMulTsd(address _user) public view returns (uint256 perc) {
        if (UNISWAP_PAIR.totalSupply() > 0) { perc = (lpTokenBalance[_user] * 100000) / UNISWAP_PAIR.totalSupply(); } }

    function _notContract(address _addr) internal view returns (bool) {
        uint32 size; assembly { size := extcodesize(_addr) } return (size == 0); }

    function sendValue(address payable recipient, uint256 amount) internal {
        (bool success, ) = recipient.call{value: amount}(''); require(success, 'Address: Failed to send value'); }
}
