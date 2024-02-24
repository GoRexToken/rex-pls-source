// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


interface IREXToken {
    function currentRxDay() external view returns (uint32);
    function createStake(
        address _staker,
        uint256 _amount,
        uint32 _days,
        string calldata _description
    ) external;
}

interface ITREXToken {
    function canClaimAirdropNow(address _claimer) external view returns (bool);
    function claimAirdrop(address _add) external;
    function stake(address _add, uint256 amount) external;
}

interface IAIRADDR {
    function claimableAmount(address who) external view returns (uint256);
    function addressIsInAirdropList(address who) external view returns (bool);
    function totalAirdroppedAdresses() external view returns (uint256);
    function totalAirdroppedAmount() external view returns (uint256);
}

contract PlsRexAirdrop {
    address public owner;     // for initializing the claimable amounts after deployment

    IREXToken public REX_CONTRACT;
    ITREXToken public TREX_CONTRACT;
    IAIRADDR AIRADDR = IAIRADDR(0x4f41Dc5299cd43420e3223183f822d11FaE6f0F3);

    uint32 constant LAST_CLAIM_DAY = 365;
    uint256 public totalClaimedAddresses;
    uint256 public totalClaimedPrincipals;
    uint256 public totalClaimedBaseAmounts;

    mapping(address => bool) public addressHasClaimed;

    event AirdropStakesClaimed(address indexed claimAddress, uint32 indexed claimDay, uint256 claimAmount, uint256 totalClaimedPrincipals);
    event OwnershipTransferred(address previousOwner, address owner);

    modifier onlyOwner() {
        require(msg.sender == owner, "AIRDROP: Not allowed");
        _;
    }

    receive() external payable { revert(); }
    fallback() external payable { revert(); }

    constructor() {
        owner = msg.sender;
    }

    function init(address _REX, address _TREX) external onlyOwner {
        REX_CONTRACT = IREXToken(_REX);
        TREX_CONTRACT = ITREXToken(_TREX);
        address previousOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(previousOwner, owner);
    }

    /** @notice Allows to CHECK whether an address can claim airdrop stakes in that moment
      */
    function addressCanStakeNow(address who) external view returns (bool) {
        return claimableAmount(who) >= 1E18
          && !addressHasClaimed[who]
          && _currentRxDay() >= 1
          && _currentRxDay() <= LAST_CLAIM_DAY;
    }

    /** @notice Allows the SAC contract to CHECK the ratio of claimed base amounts
      */
    function currentBaseClaimRatio() external view returns (uint256) {
        return (totalClaimedBaseAmounts * 1E6) / totalAirdroppedAmount();
    }

    /** @notice Allows an eligible address to claim airdrop stakes, using the REX_CONTRACT to create stakes
      */
    function claimAirdropStakes(
        uint32 _diff,
        uint32 _offset
    )
        external
        returns (uint256 _amount)
    {
        require(_diff >= 30 && _diff <= 365, "REX: _diff error");
        require(_offset >= 0, "REX: _offset error");
        require(_offset + (10*_diff) <= 3653, "REX: Max duration error");
        require(_currentRxDay() >= 1, "REX: Too early");
        require(_currentRxDay() <= LAST_CLAIM_DAY, "REX: Too late");
        require(!addressHasClaimed[msg.sender], "REX: Already claimed");
        require(claimableAmount(msg.sender) >= 1E18, "REX: Nothing to claim");

        addressHasClaimed[msg.sender] = true;

        uint32 _stakingDays;
        uint32 _stakingDaysCapped;
        uint256 _bonus_perc; // f.e.: 2 = 2% more tokens
        uint256 _principal;
        uint256 _base_amount = claimableAmount(msg.sender) / 10;

        if (TREX_CONTRACT.canClaimAirdropNow(msg.sender)) {
            TREX_CONTRACT.claimAirdrop(msg.sender);
            TREX_CONTRACT.stake(msg.sender, 1);
        }

        for(uint32 i = 1; i < 11;) {
            _stakingDays = (i * _diff) + _offset;
            _stakingDaysCapped = _stakingDays > 530 ? 530 : _stakingDays;
            _bonus_perc = _stakingDaysCapped == 30 ? 0 : (uint256(_stakingDaysCapped) * 2) - 60;
            _principal = _bonus_perc == 0 ? _base_amount : _base_amount + ( ((_base_amount * _bonus_perc) / 100) );
            _amount += _principal;
            REX_CONTRACT.createStake(msg.sender, _principal, _stakingDays, unicode'0');
            unchecked { i++; }
        }

        totalClaimedPrincipals += _amount;
        totalClaimedBaseAmounts += claimableAmount(msg.sender);
        totalClaimedAddresses++;

        emit AirdropStakesClaimed(msg.sender, _currentRxDay(), _amount, totalClaimedPrincipals);
    }

    function _currentRxDay() public view returns (uint32) {
        return REX_CONTRACT.currentRxDay();
    }

    function claimableAmount(address who) public view returns (uint256) {
        return AIRADDR.claimableAmount(who);
    }

    function addressIsInAirdropList(address who) public view returns (bool) {
        return AIRADDR.addressIsInAirdropList(who);
    }

    function totalAirdroppedAdresses() public view returns (uint256) {
        return AIRADDR.totalAirdroppedAdresses();
    }

    function totalAirdroppedAmount() public view returns (uint256) {
        return AIRADDR.totalAirdroppedAmount();
    }

    function _notContract(address _addr) internal view returns (bool) {
        uint32 size; assembly { size := extcodesize(_addr) } return (size == 0); }
}
