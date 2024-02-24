// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract AirdropAddresses {

    address public owner;     // for initializing the claimable amounts after deployment
    bool public isInitFinished = false;
    uint256 public totalAirdroppedAdresses;
    uint256 public totalAirdroppedAmount;
    mapping(address => uint256) public claimableAmount;
    event OwnershipTransferred(address previousOwner, address owner);

    modifier onlyOwner() {
        require(msg.sender == owner, "AIRDROP: No auth");
        _;
    }

    modifier onlyDuringInit() {
        require(isInitFinished == false, "AIRDROP: Init finished");
        _;
    }

    receive() external payable { revert(); }
    fallback() external payable { revert(); }

    constructor() {
        owner = msg.sender;
    }

    /** @notice A function for the owner to add the numbers to the contract
      * @dev Make sure there are NO DOUBLE ENTRIES and NO CONTRACTS in the data, revokeAccess() when finished.
      */
    function addClaimables(
        address[] calldata _address,
        uint256[] calldata _amount
    )
        external onlyOwner onlyDuringInit
    {
        require(_address.length == _amount.length, "AIRDROP: Length mismatch");
        for (uint256 i = 0; i < _address.length; i++) {
            claimableAmount[_address[i]] = _amount[i];      // assign (new) amount to address
            totalAirdroppedAmount += _amount[i];            // add amount
        }
        totalAirdroppedAdresses += _address.length;
    }

    /** @notice A function for the owner to change the claimable amount of an address
      */
    function changeClaimable(
        address _address,
        uint256 _amount
    )
        external onlyOwner onlyDuringInit
    {
        require(claimableAmount[_address] != _amount, "AIRDROP: Same amount");
        totalAirdroppedAmount += _amount;                    // add new amount
        totalAirdroppedAmount -= claimableAmount[_address];  // deduct old amount, totalAirdroppedAmount cannot be less than zero
        if (claimableAmount[_address] == 0 && _amount > 0) totalAirdroppedAdresses++;
        if (claimableAmount[_address] > 0 && _amount == 0) totalAirdroppedAdresses--;
        claimableAmount[_address] = _amount;                 // assign (new) amount to address
    }

    /** @notice A function for the owner to revoke the access after double checking the added numbers are correct
      */
    function revokeAccess() external onlyOwner onlyDuringInit {
        require(totalAirdroppedAmount > 0, "AIRDROP: No amounts set");
        isInitFinished = true;
        address previousOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(previousOwner, owner);
    }

    /** @notice Allows to CHECK whether an address is in the airdrop list
      */
    function addressIsInAirdropList(address who) external view returns (bool) {
        return claimableAmount[who] >= 1E18;
    }

    function _notContract(address _addr) internal view returns (bool) {
        uint32 size; assembly { size := extcodesize(_addr) } return (size == 0); }
}
