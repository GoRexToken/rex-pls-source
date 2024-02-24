// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


interface IREXToken {
    function currentRxDay()
        external view
        returns (uint32);

    function restoreStake(
        address _staker,
        bytes16 _stakeID
    ) external;

    function createBoughtStake(
        bytes16 _stakeID,
        address _fromAddress,
        address _toAddress
    ) external;

    function _checkStakeDataByID(
        address _staker,
        bytes16 _stakeID
    ) external view
        returns (bool, uint32, uint32, uint256, uint256);

    function buyForTreasury() external payable;
}

interface ITREX {
    function stakedTrex(address _who) external view returns (uint256);
}

contract PlsRexStakeMarket {
    IREXToken public REX_CONTRACT;
    ITREX public TREX_TOKEN;
    address public owner;   // for initializing contracts after deployment
    uint256 public noOfOffers;
    mapping(uint256 => StakeOffer) public stakeOffers;
    mapping(address => uint256) public plsEarned;
    mapping(address => uint256) public plsSpent;

    uint256[] private activeOffers;

    struct StakeOffer {
        bool isActive;
        address staker;
        uint32 offerStartDay;
        uint256 offerPrice;
        bytes16 stakeID;
    }

    struct Globals {
        uint256 totalActiveOffers;
        uint256 totalFulfilledOffers;
        uint256 totalRevokedOffers;
        uint256 totalTradingVolume;
    }

    Globals public gl;

    event NewOffer(address indexed seller, uint256 indexed price, bytes16 stakeID);
    event StakeSold(address indexed seller, address indexed buyer, uint256 indexed price, bytes16 stakeID);
    event OfferRevoked(address indexed seller, bytes16 stakeID);
    event OwnershipTransferred(address previousOwner, address owner);

    receive() external payable { revert(); }
    fallback() external payable { revert(); }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Allows the owner to init contracts
     * @dev Executed by owner
     */
    function init(address _REX, address _TREX) external {
        require(msg.sender == owner, "DEX: Not allowed");
        REX_CONTRACT = IREXToken(_REX);
        TREX_TOKEN = ITREX(_TREX);
        address previousOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(previousOwner, owner);
    }

    function listStake(
        address _staker,
        uint32 _offerStartDay,
        uint256 _offerPrice,
        bytes16 _stakeID
    )
        external
    {
        require(msg.sender == address(REX_CONTRACT), "DEX: Only REX contract");

        uint256 _ID = noOfOffers;
        noOfOffers++;

        StakeOffer memory _offer;

        _offer.isActive = true;
        _offer.staker = _staker;
        _offer.offerStartDay = _offerStartDay;
        _offer.offerPrice = _offerPrice;
        _offer.stakeID = _stakeID;

        stakeOffers[_ID] = _offer;

        gl.totalActiveOffers++;
        activeOffers.push(_ID);

        emit NewOffer(_staker, _offerPrice, _stakeID);
    }

    /**
     * @notice Function for a user (not a contract) to buy a STAKE with PLS
     * @dev PRICE + (if !TREX staker:) offerPrice*0.05 for service
     * @param _offerID of the STAKE
     */
    function buyStakeFromList(
        uint256 _offerID
    )
        external payable
    {
        StakeOffer storage _offer = stakeOffers[_offerID];

        require(_offer.staker != msg.sender, "DEX: Cannot buy your own stake");
        require(_offer.isActive, "DEX: Offer not active");
        require(_notContract(msg.sender) && msg.sender == tx.origin, "DEX: Buyer not an address");
        require(_currentRxDay() <= (_offer.offerStartDay + 14), "DEX: Offer has expired");

        _offer.isActive = false; // reentrancy check

          // if the caller is not a TREX STAKER: pay a fee of 5%
          // fee is used to buy REX from the pair to drive the price
        if(TREX_TOKEN.stakedTrex(msg.sender) == 0) {
            uint256 _fee = _offer.offerPrice / 20;
            require(msg.value == _offer.offerPrice + _fee, "DEX: Wrong PLS amount");
            plsSpent[msg.sender] += _fee;
            REX_CONTRACT.buyForTreasury{value: _fee}();
        }
        else {
            require(msg.value == _offer.offerPrice, "DEX: Wrong PLS amount");
        }

          // pay the seller and track earnings
        sendValue(payable(_offer.staker), _offer.offerPrice);
        plsEarned[_offer.staker] += _offer.offerPrice;
        plsSpent[msg.sender] += _offer.offerPrice;

        gl.totalActiveOffers = gl.totalActiveOffers >= 1 ? (gl.totalActiveOffers - 1) : 0;
        gl.totalFulfilledOffers++;
        gl.totalTradingVolume += _offer.offerPrice;

        _removeFromActiveListing(_offerID);

        REX_CONTRACT.createBoughtStake(_offer.stakeID, _offer.staker, msg.sender);

        emit StakeSold(_offer.staker, msg.sender, _offer.offerPrice, _offer.stakeID);
    }

    function revokeOffer(
        uint256 _offerID
    )
        external
    {
        StakeOffer storage _offer = stakeOffers[_offerID];

        require(_offer.staker == msg.sender, "DEX: Only stake owner");
        require(_offer.isActive, "DEX: Cannot revoke");

        _offer.isActive = false;
        _removeFromActiveListing(_offerID);

        gl.totalActiveOffers--;
        gl.totalRevokedOffers++;

        REX_CONTRACT.restoreStake(msg.sender, _offer.stakeID);

        emit OfferRevoked(msg.sender, _offer.stakeID);
    }

    function getListings() external view returns (uint256[] memory offerIds) {
        return activeOffers;
    }

    function getListing(uint256 _index) external view returns (uint256) {
        require(_index < noOfOffers, "index out of range for listing");
        return activeOffers[_index];
    }

    function _removeFromActiveListing(uint256 _offerId) private {
        for (uint i=0; i < activeOffers.length; i++) {
            if (activeOffers[i] == _offerId) {
                activeOffers[i] = activeOffers[activeOffers.length - 1];
                activeOffers.pop();
                break;
            }
        }
    }

    /**
     * @notice A function to unlist expired offers - for the front end table loading
     */
    function cleanListing() external {
        for (uint i=0; i < activeOffers.length; i++) {
            StakeOffer memory _offer = stakeOffers[i];
            if (_currentRxDay() > (_offer.offerStartDay + 14)) {
                activeOffers[i] = activeOffers[activeOffers.length - 1];
                activeOffers.pop();
                break;
            }
        }
    }

    function getNoOfActiveOffers() external view returns (uint256){
        return gl.totalActiveOffers;
    }

    /**
     * @notice Function for the front end to read the precise offerPrice + fee
     */
    function getPriceWithFee(uint256 _offerID) external view returns (uint256){
        return stakeOffers[_offerID].offerPrice + (stakeOffers[_offerID].offerPrice / 20);
    }

    /** @notice Shows current day of RexToken
      * @dev Fetched from REX_CONTRACT
      * @return Iteration day since REX inception
      */
    function _currentRxDay() public view returns (uint32) {
        return REX_CONTRACT.currentRxDay();
    }

    function _notContract(address _addr) private view returns (bool) {
        uint32 size; assembly { size := extcodesize(_addr) } return (size == 0); }

    function sendValue(address payable recipient, uint256 amount) private {
        (bool success, ) = recipient.call{value: amount}(''); require(success, 'DEX: Failed to send value'); }

    function dataOfOfferNumber(uint256 _offerID) external view
        returns (address staker, bool[2] memory _bools, uint32[3] memory _days, uint256[3] memory _amounts)
    {
        staker = stakeOffers[_offerID].staker;

        _bools[0] = stakeOffers[_offerID].isActive;
        _days[0] = stakeOffers[_offerID].offerStartDay;
        _amounts[0] = stakeOffers[_offerID].offerPrice;

          // load the rest of the STAKE data:
          // _stake.isTrex, _stake.startDay, _stake.finalDay, _stake.stakesShares, _stake.stakedAmount
        (
        _bools[1],
        _days[1],
        _days[2],
        _amounts[1],
        _amounts[2] ) = REX_CONTRACT._checkStakeDataByID(staker, stakeOffers[_offerID].stakeID);
    }
}
