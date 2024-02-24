// SPDX-License-Identifier: MIT


// File: @openzeppelin/contracts/utils/introspection/IERC165.sol
// OpenZeppelin Contracts v4.4.1 (utils/introspection/IERC165.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// File: @openzeppelin/contracts/token/ERC721/IERC721.sol
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC721/IERC721.sol)

pragma solidity ^0.8.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Note that the caller is responsible to confirm that the recipient is capable of receiving ERC721
     * or else they may be permanently lost. Usage of {safeTransferFrom} prevents loss, though the caller must
     * understand this adds an external call which potentially creates a reentrancy vulnerability.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool approved) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}


// File: @openzeppelin/contracts/token/ERC721/IERC721Receiver.sol
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC721/IERC721Receiver.sol)

pragma solidity ^0.8.0;

/**
 * @title ERC721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}


// File: @openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC721/utils/ERC721Holder.sol)

pragma solidity ^0.8.0;

/**
 * @dev Implementation of the {IERC721Receiver} interface.
 *
 * Accepts all token transfers.
 * Make sure the contract is able to use its token with {IERC721-safeTransferFrom}, {IERC721-approve} or {IERC721-setApprovalForAll}.
 */
contract ERC721Holder is IERC721Receiver {
    /**
     * @dev See {IERC721Receiver-onERC721Received}.
     *
     * Always returns `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
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


/// @dev interface for interacting with pairs/pools
interface IUniswapV2Pair {
    function token0() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}


/// @dev interface for interacting with the router
interface IUniswapV2Router02 {
    function WPLS() external pure returns (address);
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}


// interface for rex contract
interface IREX {
    function addSellable(address _account, uint256 _amount) external;
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function PAIR() external returns (IUniswapV2Pair);
    function balanceOf(address account) external returns (uint256);
    function mintAsSubcontract(address account, uint256 amount) external;
    function setInternal(bool inter) external;
}


// interface for TREX contract
interface ITREX {
    function stakedTrex(address _who) external view returns (uint256);
}


// interface for REX NFT contract
interface INFT {
    function addPlsToNft(uint256 tokenId, uint256 amount) external;
    function plsStored(uint256 tokenId) external view returns (uint256);
}

// interface for WPLS
interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

pragma solidity 0.8.19;

contract PlsRexNftStaking is ERC721Holder, ReentrancyGuard {

    uint256 public txs;
    uint256 public totalRexPayout;
    uint256 public totalPlsValuePayout;

    IREX public rex;
    ITREX public trex;
    IERC721 public nft;
    address public market;
    address private deployer;
    address public highestFundAddress;
    uint256 public highestFundAmount;
    IUniswapV2Pair private PAIR;
    IUniswapV2Router02 private constant UNISWAP_ROUTER = IUniswapV2Router02(0x165C3410fC91EF562C50559f7d2289fEbed552d9);

    /// @notice tracks the staked tokenIds
    struct Staker {
        uint256[] tokenIds;
    }

    /// @dev Create a deposit dependent staking contract for an nft collection and an ERC20 reward token (rex)
    constructor() {
        deployer = msg.sender;
    }

    function init(IREX _REX, ITREX _TREX, IERC721 _NFT, address _MARKET) external {
        require(msg.sender == deployer, "No auth");
        rex = _REX;
        PAIR = _REX.PAIR();
        trex = _TREX;
        nft = _NFT;
        market = _MARKET;
        deployer = address(0);
    }

    /// @notice mapping of a staker to its wallet
    mapping(address => Staker) private stakers;

    /// @notice Mapping from token ID to owner address
    mapping(uint256 => address) private tokenOwner;

    /// @notice mapping of a staker to its userStakedPls to calculate plsPerSecond
    mapping(address => uint256) public userStakedPls;

    /// @notice mapping of a staker to its sum of all timestampStaked (of all of its NFTs)
    mapping(address => uint256) private sumOfTimestamps;

    /// @notice mapping of a staker to its lastClaimTimestamp
    mapping(address => uint256) public lastClaimTimestamp;

    /// @notice mapping of a tokenID to its lastFeedTimestamp
    mapping(uint256 => uint256) public lastFeedTimestamp;

    /// @notice STATS: mapping of a staker to its total received REX amount
    mapping(address => uint256) public plsValueReceived;

    /// @notice STATS: mapping of a staker to its total received PLS amount
    mapping(address => uint256) public rexReceived;

    /// @notice mapping of a funder to its amount
    mapping(address => uint256) private fundersAmount;

    /// @notice event emitted when a user has staked an nft
    event Stake(address owner, uint256 amount);

    /// @notice event emitted when a user has unstaked an nft
    event Unstake(address owner, uint256 amount);

    /// @notice event emitted when a user has fed an nft
    event Feed(address owner, uint256 tokenId, uint256 plsAmount);

    /// @notice event emitted when a user claims reward
    event RewardPaid(address indexed user, uint256 rexReceived, uint256 plsValueReceived);

    // @notice event emitted when funding is sent to contract
    event Fund(address indexed source, uint amount);

    /// @dev Retrieves the balance of tokens staked
    function totalSupply() public view returns (uint256) {
        return nft.balanceOf(address(this));
    }

    /// @dev Retrieve the token balance of any single address
    function balanceOf(address _user) public view returns (uint256) {
        return stakers[_user].tokenIds.length;
    }

    /// @dev Retrieve the total received REX rewards of any single address
    function totalRewardsOf(address _user) external view returns (uint256) {
        return rexReceived[_user];
    }

    /// @dev Retrieves the owner of any given _tokenID
    function ownerOf(uint256 _tokenId) public view returns (address) {
        return tokenOwner[_tokenId];
    }

    /// @dev Retrieve the tokenIds of any single address
    function tokensOfOwner(
        address _owner
    ) public view returns (uint256[] memory tokenIds) {
        return stakers[_owner].tokenIds;
    }

    /// @dev Retrieves the data set of any single address, to use in front end
    function userData(address _user) external view returns (uint256[7] memory data) {
        data[0] = plsValueReceived[_user];
        data[1] = rexReceived[_user];
        data[2] = userStakedPls[_user];
        data[3] = sumOfTimestamps[_user];
        data[4] = lastClaimTimestamp[_user];
        data[5] = stakers[_user].tokenIds.length;
        data[6] = getTotalRestoreAmount(_user);
    }

    /// @dev Retrieves the reserves in the PAIR (rex, pls)
    function getPairReserves() public view returns (uint256 _rex, uint256 _pls) {
        if (PAIR.token0() == address(rex)) { (_rex, _pls, ) = PAIR.getReserves(); }
        else { (_pls, _rex, ) = PAIR.getReserves(); }
    }

    /// @notice Retrieves the currently claimable PLS value of any single address
    function getClaimablePlsValue(address _user) private view returns (uint256) {
        return ((balanceOf(_user) * block.timestamp) - sumOfTimestamps[_user]) * (userStakedPls[_user] / 86400000);
    }

    /// @notice Retrieve the claimable REX rewards and the corresponding PLS value of any single address
    function rewardsOf(address _user) public view returns (uint256 rexToReceive, uint256 plsValueToReceive) {
        plsValueToReceive = getClaimablePlsValue(_user);

        // calculate late claim penalty (in case of unhealthy NFTs):
        // < 30 days no penalty, then -5% payout every 30 days, min payout 50%
        // and then cap: total payout must not exceed the userStakedPls
        uint256 monthsLate = ((block.timestamp - lastClaimTimestamp[_user]) / 86400) / 30;
        if (monthsLate > 0) {
            uint256 penaltyPercent = (monthsLate * 5) > 50 ? 50 : monthsLate * 5;
            plsValueToReceive = plsValueToReceive - ((plsValueToReceive * penaltyPercent) / 100);
            if (userStakedPls[_user] > rexReceived[_user]) {
                plsValueToReceive = userStakedPls[_user] - rexReceived[_user];  // cap
            } else {
                plsValueToReceive = 0;                                          // cap exceeded
            }
        }
        if (plsValueToReceive > 0) {
            // calculate corresponding REX amount, based on the current price, using the math of PULSEX's getAmountIn
            (uint256 rexRes, uint256 plsRes) = getPairReserves();
            rexToReceive = ( (((rexRes * plsValueToReceive) * 10000)) / ((plsRes - plsValueToReceive) * 9971) ) + 1;
        }
    }

     /// @dev The percentage: userNftBalance / totalSupply (1E18 precision)
    function percentage(address _user) public view returns (uint256) {
        if (totalSupply() == 0) return 0;
        return (balanceOf(_user) * 1E18) / totalSupply();
    }

    /// @dev A function to send REX to this contract, sender must approve REX first
    function fundRex(uint256 _amount) external nonReentrant {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "NFTSTAKING: Not an address");
        require(_amount > 0, "NFTSTAKING: No amount");
        rex.setInternal(true);
        require(rex.transferFrom(msg.sender, address(this), _amount), "NFTSTAKING: Transfer failed");
        rex.setInternal(false);
        fundersAmount[msg.sender] += _amount;
        // keep track of funders, in case any events shall be based on that
        if(fundersAmount[msg.sender] > highestFundAmount) {
            highestFundAmount = fundersAmount[msg.sender];
            highestFundAddress = msg.sender;
        }
        emit Fund(msg.sender, _amount);
    }

    /// @dev Stakes one or more tokens if owned by the sender
    function stake(uint256[] memory tokenIds) external nonReentrant {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "NFTSTAKING: Not an address");
        require(!hasUnhealthy(msg.sender), "NFTSTAKING: Unhealthy NFT found");
        require(tokenIds.length + balanceOf(msg.sender) <= 10, "NFTSTAKING: Max 10 staked");

        if (balanceOf(msg.sender) > 0) {
            _claimReward(msg.sender);
        }
        else {
            lastClaimTimestamp[msg.sender] = block.timestamp;
        }

        for (uint256 i = 0; i < tokenIds.length; i++) {
            _stake(msg.sender, tokenIds[i]);
        }

        sumOfTimestamps[msg.sender] = balanceOf(msg.sender) * block.timestamp;  // reset sumOfTimestamps to new balance

        txs++;
    }

    /// @notice Unstakes one or more tokens if owned by the sender
    /// @notice User needs to feed the NFT to unstake it (prevents from misuse by repeatingly staking+unstaking)
    /// @dev get the (sum of) minFeedAmount first
    function unstake(uint256[] memory tokenIds) external payable nonReentrant {
        require(!hasUnhealthy(msg.sender), "NFTSTAKING: Unhealthy NFT found");
        _claimReward(msg.sender);

        uint256 feedAmount;
        uint256 totalFeedAmount = 0;

        for (uint i = 0; i < tokenIds.length; i++) {
            require(tokenOwner[tokenIds[i]] == msg.sender, "NFTSTAKING: Not the owner");
            feedAmount = amountFeedable(tokenIds[i]);         // get min feed amount
            _feed(msg.sender, tokenIds[i], feedAmount);       // feed
            totalFeedAmount += feedAmount;                    // sum up for later PLS check
        }

        require(msg.value == totalFeedAmount, "NFTSTAKING: Wrong PLS amount");

        _instaBuy(totalFeedAmount);

        for (uint256 i = 0; i < tokenIds.length; i++) {
            _unstake(msg.sender, tokenIds[i]);
        }

        sumOfTimestamps[msg.sender] = balanceOf(msg.sender) * block.timestamp;  // reset sumOfTimestamps to new balance

        txs++;
    }

    /// @notice Attempt to claim the available dividends for sender
    function claim() external nonReentrant {
        require(!hasUnhealthy(msg.sender), "NFTSTAKING: Unhealthy NFT found");
        _claimReward(msg.sender);
        txs++;
    }

    /// @notice Returns the MINIMUM feedable PLS amount: 1% of PLS amount stored (at least 100k PLS)
    /// @dev Doesn't check ownership of NFTs.
    function amountFeedable(uint256 tokenId) public view returns (uint256 feedAmount) {
        feedAmount = INFT(address(nft)).plsStored(tokenId);
        if (feedAmount > 0) {
            feedAmount = feedAmount / 100 > 1E23 ? feedAmount / 100 : 1E23;
        }
    }

    /// @dev Returns two arrays with the tokenIds and min feedable PLS amounts of any user, plus the total PLS amount
    function getMinFeedArray(address user) external view returns (uint256[] memory tokenIds, uint256[] memory amounts, uint256 totalAmount) {
        Staker memory staker = stakers[user];
        tokenIds = new uint256[](staker.tokenIds.length);
        amounts = new uint256[](staker.tokenIds.length);
        for (uint i = 0; i < staker.tokenIds.length; i++) {
            tokenIds[i] = staker.tokenIds[i];
            amounts[i] = amountFeedable(tokenIds[i]);
            totalAmount += amounts[i];
        }
    }

    /// @notice Feeds one or more NFTs, if owned by the sender, with the given plsAmounts
    /// @notice If there are unhealthy NFTs, the user needs to restore their health first
    function feed(uint256[] memory tokenIds, uint256[] memory plsAmounts) external payable nonReentrant {
        require(!hasUnhealthy(msg.sender), "NFTSTAKING: Unhealthy NFT found");
        require(tokenIds.length == plsAmounts.length, "NFTSTAKING: Array length mismatch");

        _claimReward(msg.sender);

        uint256 minFeedAmount;
        uint256 totalFeedAmount = 0;

        for (uint i = 0; i < tokenIds.length; i++) {
            require(tokenOwner[tokenIds[i]] == msg.sender, "NFTSTAKING: Not the owner of the NFT");
            minFeedAmount = amountFeedable(tokenIds[i]);                              // get min feed amount
            require(plsAmounts[i] >= minFeedAmount, "NFTSTAKING: Not enough PLS");    // check requirement fulfilled
            _feed(msg.sender, tokenIds[i], plsAmounts[i]);                            // feed
            totalFeedAmount += plsAmounts[i];                                         // sum up for later PLS check
        }

        require(msg.value >= totalFeedAmount, "NFTSTAKING: Wrong PLS amount");

        uint256 remainder = msg.value - totalFeedAmount;
        if (remainder > 0) {
            sendValue(payable(msg.sender), remainder);
        }

        _instaBuy(totalFeedAmount);

        txs++;
    }

    /// @notice Gets the needed plsAmount for all unhealthy NFTs of a user to restore the NFTs
    function getTotalRestoreAmount(address _user) public view returns (uint256 totalRestoreAmount) {
        Staker memory staker = stakers[_user];
        uint256 restoreAmount;
        for (uint i = 0; i < staker.tokenIds.length; i++) {
            restoreAmount = getRestoreAmount(staker.tokenIds[i]);
            if (restoreAmount > 0) {
                totalRestoreAmount += restoreAmount;
            }
        }
    }

    /// @notice Returns the needed plsAmount for an unhealthy NFTs to restore them
    /// @dev Returns 0 for non-existing NFTs and for healthy NFTs
    function getRestoreAmount(uint256 tokenId) public view returns (uint256 amount) {

        // calculate feed amount: < 30 days no feed, then 1% every 30 days needed (min 100k)
        // monthsLate: result is a number between 0 and x months
        uint256 monthsLate = ((block.timestamp - lastFeedTimestamp[tokenId]) / 86400) / 30;
        if (monthsLate == 0) return amount;

        amount = INFT(address(nft)).plsStored(tokenId);         // current PLS stored, deduct later after loop
        for (uint i = 0; i < monthsLate; i++) {
            amount += amount / 100 > 1E23 ? amount / 100 : 1E23;  // 1%/month, min 100000E18 PLS (= 1E23)
        }
        amount -= INFT(address(nft)).plsStored(tokenId);        // deduct the first amount
    }

    /// @notice Restores health of all unhealthy NFTs owned by the sender, with the needed plsAmount for each NFT
    /// @dev User must send the correct amount of PLS, get the amount via "getTotalRestoreAmount(user)" first
    function restore() external payable nonReentrant {
        _claimReward(msg.sender);

        uint256 restoreAmount;
        uint256 totalRestoreAmount;
        Staker storage staker = stakers[msg.sender];
        for (uint i = 0; i < staker.tokenIds.length; i++) {
            restoreAmount = getRestoreAmount(staker.tokenIds[i]);
            if (restoreAmount > 0) {
                totalRestoreAmount += restoreAmount;
                _feed(msg.sender, staker.tokenIds[i], restoreAmount);
            }
        }

        require(totalRestoreAmount == msg.value, "NFTSTAKING: Wrong PLS amount");

        // buy REX immediately
        _instaBuy(msg.value);

        txs++;
    }

    /// @notice Returns a bool whether the user has unhealthy NFTs staked (must feed them first)
    function hasUnhealthy(address _user) public view returns (bool) {
        Staker memory staker = stakers[_user];
        for (uint i = 0; i < staker.tokenIds.length; i++) {
            if (((block.timestamp - lastFeedTimestamp[staker.tokenIds[i]]) / 86400) / 30 > 0)
                return true;
        }
        return false;
    }

    function _stake(address _user, uint256 _tokenId) private {
        require(
            nft.ownerOf(_tokenId) == _user &&
            (nft.getApproved(_tokenId) == address(this) ||
            nft.isApprovedForAll(_user, address(this))),
            "NFTSTAKING: Not owned or approved"
        );
        Staker storage staker = stakers[_user];
        staker.tokenIds.push(_tokenId);
        tokenOwner[_tokenId] = _user;    // assign ownership within this contract
        nft.safeTransferFrom(_user, address(this), _tokenId);
        userStakedPls[_user] += INFT(address(nft)).plsStored(_tokenId);
        lastFeedTimestamp[_tokenId] = block.timestamp;
        emit Stake(_user, _tokenId);
    }

    function _unstake(address _user, uint256 _tokenId) private {
        Staker storage staker = stakers[_user];
        // remove _tokenId from list
        for (uint i=0; i < staker.tokenIds.length; i++) {
            if (staker.tokenIds[i] == _tokenId) {
                staker.tokenIds[i] = staker.tokenIds[staker.tokenIds.length - 1];
                staker.tokenIds.pop();
                break;
            }
        }

        delete tokenOwner[_tokenId];   // remove ownership
        nft.safeTransferFrom(address(this), _user, _tokenId);
        userStakedPls[_user] -= INFT(address(nft)).plsStored(_tokenId);
        emit Unstake(_user, _tokenId);
    }

    function _feed(address _user, uint256 _tokenId, uint256 _pls) private {
        INFT(address(nft)).addPlsToNft(_tokenId, _pls);
        userStakedPls[_user] += _pls;
        lastFeedTimestamp[_tokenId] = block.timestamp;
        emit Feed(_user, _tokenId, _pls);
    }

    function _claimReward(address _user) private {
        (uint256 _rexReceived, uint256 _plsValueReceived) = rewardsOf(_user);

        if (_rexReceived > 0) {

            // set the sum to current value to avoid overpayment and set the current lastClaimTimestamp
            sumOfTimestamps[_user] = balanceOf(_user) * block.timestamp;
            lastClaimTimestamp[msg.sender] = block.timestamp;

            // stats
            rexReceived[_user] += _rexReceived;
            totalRexPayout += _rexReceived;
            plsValueReceived[_user] += _plsValueReceived;
            totalPlsValuePayout += _plsValueReceived;

            // check contract's REX balance and get more REX if not enough left
            uint256 rexBal = rex.balanceOf(address(this));
            if (_rexReceived > rexBal) {
                rex.mintAsSubcontract(address(this), _rexReceived - rexBal);
            }

            // transfer REX
            rex.setInternal(true);
            rex.transfer(_user, _rexReceived);
            rex.setInternal(false);

            // addSellable: credit the sellable amount
            // depending on TREX staked (1 to 5 TREX),
            // there is 1.0 to 1.5 times the _rexReceived
            // so the bonus is 10/10 or 11/10 or ... 15/10
            uint256 bonusPerc = uint256(10) + trex.stakedTrex(_user);  // where stakedTrex(_user) == 0 to 5
            rex.addSellable(
                _user,
                (_rexReceived * bonusPerc) / 10
            );

            emit RewardPaid(_user, _rexReceived, _plsValueReceived);
        }
    }

    function _instaBuy(uint256 amount) private {
        address[] memory path = new address[](2);
        path[0] = UNISWAP_ROUTER.WPLS();
        path[1] = address(rex);
        rex.setInternal(true);
        UNISWAP_ROUTER.swapExactETHForTokensSupportingFeeOnTransferTokens{value:amount}(0, path, address(this), block.timestamp + 60 seconds);
        rex.setInternal(false);
    }

    function sendValue(address payable recipient, uint256 amount) private {
        (bool success, ) = recipient.call{value: amount}(''); require(success, "NFTSTAKING: Failed to send value");
    }

    function _notContract(address _addr) internal view returns (bool) {
        uint32 size;
        assembly { size := extcodesize(_addr) }
        return (size == 0);
    }

    /// @notice WPLS may be sent to the contract when user's trade on non-native NFT marketplaces
    /// @notice This is not intended. This function buys REX from the pair and sends it to this contract, which is the original intention.
    /// @dev Has to be triggered manually by anyone
    function buyWithWpls() external {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "NFTSTAKING: Not an address");
        uint256 amo = IERC20(0xA1077a294dDE1B09bB078844df40758a5D0f9a27).balanceOf(address(this));
        require(amo >= 1E25, "NFTSTAKING: Not enough WPLS");
        address[] memory path = new address[](2);
        path[0] = UNISWAP_ROUTER.WPLS();
        path[1] = address(rex);
        IERC20(0xA1077a294dDE1B09bB078844df40758a5D0f9a27).approve(address(UNISWAP_ROUTER), amo);
        rex.setInternal(true);
        UNISWAP_ROUTER.swapExactTokensForTokensSupportingFeeOnTransferTokens(amo, 0, path, address(this), block.timestamp + 60 seconds);
        rex.setInternal(false);
    }

    /// @notice PLS may be sent to the contract when user's trade on non-native NFT marketplaces
    /// @notice This is not intended. This function buys REX from the pair and sends it to this contract, which is the original intention.
    /// @dev Has to be triggered manually by anyone
    function buyWithPls() external {
        require(_notContract(msg.sender) && msg.sender == tx.origin, "NFTSTAKING: Not an address");
        uint256 amo = address(this).balance;
        require(amo >= 1E26, "NFTSTAKING: Not enough PLS");
        address[] memory path = new address[](2);
        path[0] = UNISWAP_ROUTER.WPLS();
        path[1] = address(rex);
        rex.setInternal(true);
        UNISWAP_ROUTER.swapExactETHForTokensSupportingFeeOnTransferTokens{value:amo}(0, path, address(this), block.timestamp + 60 seconds);
        rex.setInternal(false);
    }
}
