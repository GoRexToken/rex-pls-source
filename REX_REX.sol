// SPDX-License-Identifier: MIT

/*

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░               ░░░░░░░░░░░
░░░░░░░░░░░    WARNING    ░░░░░░░░░░░
░░░░░░░░░░░               ░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░                              ░░░░
░░░   DO NOT USE THIS CONTRACT   ░░░░
░░░   IF YOU HAVEN'T READ THIS   ░░░░
░░░                              ░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░ REX is a CLOSED ECOSYSTEM.      ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░ REX has been designed to work   ░░
░░ as a PURE STAKING TOKEN.        ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░ It does NOT work as a currency, ░░
░░ as it is NOT TRANSFERABLE       ░░
░░ to other accounts [on purpose]. ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░ Accounts may swap PLS to REX    ░░
░░ ANYTIME using the liquid pair   ░░
░░ (available from DAY 22) - BUT   ░░
░░ accounts may NOT swap back REX  ░░
░░ to PLS, unless they have used   ░░
░░ the protocol and earned a       ░░
░░ "sellable" amount. That means,  ░░
░░ accounts may ONLY swap back     ░░
░░ a certain REX amount, if they   ░░
░░ have this "sellable".           ░░
░░                                 ░░
░░ To earn a "sellable" amount,    ░░
░░ the protocol provides           ░░
░░                                 ░░
░░  1) REX token staking,          ░░
░░  2) NFT staking and             ░░
░░  3) liquidity provision.        ░░
░░                                 ░░
░░ These options help creating     ░░
░░ constant PLS inflow, push the   ░░
░░ price and also lead to the      ░░
░░ opportunity to create a         ░░
░░ personal strategy.              ░░
░░                                 ░░
░░ This REX implementation is      ░░
░░ very restricted, but it has     ░░
░░ strong design elements to       ░░
░░ massively grow in price, to     ░░
░░ maintain user interaction and   ░░
░░ to combine fun and strategy.    ░░
░░                                 ░░
░░ Particularly, the restrictions  ░░
░░ are good to protect the values  ░░
░░ against swing traders and bots. ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░   DO NOT "BUY" THE TOKEN        ░░
░░   if you intend to TRADE it     ░░
░░   without using the protocol    ░░
░░                                 ░░
░░   IT WILL NOT WORK              ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░      SPECIAL RISK WARNING       ░░
░░                                 ░░
░░   Apart from the usual risks    ░░
░░   attached to using crypto and  ░░
░░   smart contracts, be aware     ░░
░░   that this implementation is   ░░
░░                                 ░░
░░     H I G H L Y   R I S K Y     ░░
░░                                 ░░
░░   to use, as it provides brand  ░░
░░   new functions and has a lot   ░░
░░   of contract dependencies and  ░░
░░   is deployed on a quite new    ░░
░░   blockchain that might fail -  ░░
░░   so there is a chance that an  ░░
░░   UNFORESEEABLE event occurs    ░░
░░   which potentially leads to a  ░░
░░                                 ░░
░░       T O T A L   L O S S       ░░
░░                                 ░░
░░   for one user, for many users  ░░
░░   or even for all users.        ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░                                 ░░
░░   THIS IS CRYPTO / DEFI.        ░░
░░                                 ░░
░░   This is not a traditional     ░░
░░   bank with security deposits   ░░
░░   (and near-to-zero ROI).       ░░
░░                                 ░░
░░   Rather, it is little more     ░░
░░   than pure speculation         ░░
░░   (that may bring amazing ROI). ░░
░░                                 ░░
░░   THERE ARE NO GUARANTEES.      ░░
░░                                 ░░
░░   If you are looking for        ░░
░░   something with low-risk,      ░░
░░   this is not for you.          ░░
░░                                 ░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


End of warnings.

Let's have a look at what this
new protocol is supposed to do.


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


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░██████╗░░░███████╗░░██╗░░░██╗░░░░
░░░░██╔══██╗░░██╔════╝░░╚██╗░██╔╝░░░░
░░░░██████╔╝░░█████╗░░░░░╚████╔╝░░░░░
░░░░██╔══██╗░░██╔══╝░░░░░██╔═██╗░░░░░
░░░░██║░░██║░░███████╗░░██╔╝░░██╗░░░░
░░░░╚═╝░░╚═╝░░╚══════╝░░╚═╝░░░╚═╝░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░ Latin: king, ruler, monarch ░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░ Copyright 2024 pls-rex.io ░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
# REX TOKEN -- MAIN CONTRACT
# PART OF "REX" SMART CONTRACTS
# FOR DEPLOYMENT: PULSECHAIN, ID: 369
# SOURCE OF TRUTH: app.pls-rex.io
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
# Name      :: REX
# Ticker    :: REX
# Decimals  :: 18
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
# Launch:
# GMT: Friday, 23. Feb, 2024 18:00:00
# "DAY 1" starts on 1708711200 (unix)
# "DAY 0" (internal use): 1708624800
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░ DISCLAIMER ░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
Using this Smart Contract, you must
have NO profit expectations, at all.
REX is not money.
REX is not an investment.
REX is not a company or legal entity.
REX is software consisting of
ownerless adminless Smart Contracts
running on a blockchain on their own.
Blockchain / Smart Contracts are new
technology and HIGHLY RISKY to use.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
This software may break ANYTIME for
ANY reason, which might result in a
TOTAL LOSS of ALL YOUR TOKENS.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
NEVER use cryptocurrencies as "money"
or "source of income".
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░ THERE IS NO TOKEN EMISSION ░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
REX tokens are not for sale. There is
no emitting party. REX tokens are
airdropped to and claimable for
certain blockchain addresses.
REX tokens DO NOT HAVE ANY VALUE
at the time of the launch or airdrop.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
NEW: The concept of "sellable" tokens
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
Like any token offers a "balanceOf"
function that returns an account's
balance of the token, "sellableOf"
returns the value of tokens sellable
on a DEX, more precisely the amount
of tokens swappable in the REX pair.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
So, "sellableOf" has been introduced
as a new variable for each account
that tracks its allowance to "sell"
tokens. The idea (and effect) is to
prevent swing traders from taking
profit without actually using the
protocol for what is has been made.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
It also prevents from trading bot and
arbitrage bots. It's made for humans.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
Another positive effect may be a good
and appealing price chart, so new
users may find the protocol when it
is "trending" on the known platforms.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░ WREX: A MIGHTY UNLOCKABLE FEATURE ░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
As explained above, REX is restricted
and not even transferable between
accounts. This makes it impossible
to integrate it into other projects,
use it as a currency or have it
listed on any CEXes.
Therefore, the contract will
automatically unlock another token,
called WREX [Wrapped REX] on DAY 180,
which is essentially a tradable REX.
WREX is a standard ERC-20 token,
transferable, tradable and suitable
to be listed on CEXes.
Once activated, WREX cannot be
deactivated.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
When WREX is active, users may wrap
REX + Sellable Amount to WREX and
vice-versa. Wrapping REX burns REX,
reduces "sellableOf" and mints WREX.
In this way the REX total supply gets
split between both tokens. Every WREX
can only be minted from burning a REX.
The "sellableOf" of the converting
user is reduced by the conversion
amount, because basically you're
converting a non-sellable REX to a
sellable REX, so the sellabeOf
needs to be reduced too.
But since this user has invested in
REX and grew the sellabeOf amount,
this user will therefore be credited
with a "sellableReserve" in the
contract.
Whenever the user converts back
WREX to REX, this user will be given
back REX _AND_ the corresponding
sellableOf amount (so the user could
sell the REX, as he could have before
the conversion).
In contrast to this user, think of
a user who never took part in REX,
never earned a sellableOf, never
converted REX to WREX and only got
WREX on a CEX and now tries to
convert it to REX to sell it
(because the price of REX might be
higher than WREX in this example).
This user (who has no
"sellableReserve" from protocol
participation), will not be given
the sellabeOf amount, but only REX.
This leads to the necessity for this
user to first use the protocol to
earn a sellableOf amount - to be able
to sell the REX.
This mechanism allows the REX price
to grow (more than WREX probabaly) -
and be protected from WREX trades
at the same time.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
In summary, buying REX and earning
sellabeOf amounts helps the protocol
grow and helps the REX price grow.
Instead of selling REX and thus
reducing the REX price, users may
decide to convert REX to WREX, for
example because there is a pair for
WREX and there are more or other
opportunities.
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
There are english comments in the
code, so it's easier to understand
(if you are willing to try.)
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 H A V E   F U N   U S I N G   R E X
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░


*/

pragma solidity 0.8.19;

interface IUniswapV2Factory {
    function createPair(address tokenA, address tokenB) external returns (address pair);
}

interface IUniswapV2Pair {
    function factory() external view returns (address);
}

interface IUniswapV2Router02 {
    function factory() external pure returns (address);
    function WPLS() external pure returns (address);
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
}

interface IREXDEX {
    function listStake(
        address staker,
        uint32 offerStartDay,
        uint256 offerPrice,
        bytes16 stakeID
    )   external;
}

interface ISAC {
    function isRexAmountSet() external view returns (bool);
}

interface ITREX {
    function stakedTrex(address _who) external view returns (uint256);
}

interface IWREX {
    function balanceOf(address account) external view returns (uint256);
    function burnForRex(address from, uint256 amount) external;
    function mintForRex(address to, uint256 amount) external;
}

interface INFT {
    function mintPrice() external view returns (uint256);
    function mintPriceMany(uint256 count) external view returns (uint256);
    function safeMint(address to) external;
}

interface INFTSTAKE {
    function market() external view returns (address);
}

interface INFTTrait {
    function add(uint batchSize) external;
}

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 */
interface IERC20Metadata is IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}

/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.openzeppelin.com/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * The default value of {decimals} is 18. To change this, you should override
 * this function so it returns a different value.
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC20
 * applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the default value returned by this function, unless
     * it's overridden.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    function burn(uint256 amount) external returns (bool) {
        address owner = _msgSender();
        _burn(owner, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `amount`.
     */
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `from` to `to`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `from` must have a balance of at least `amount`.
     */
    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            // Overflow not possible: the sum of all balances is capped by totalSupply, and the sum is preserved by
            // decrementing then incrementing.
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply += amount;
        unchecked {
            // Overflow not possible: balance + amount is at most totalSupply + amount, which is checked above.
            _balances[account] += amount;
        }
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
            // Overflow not possible: amount <= accountBalance <= totalSupply.
            _totalSupply -= amount;
        }

        emit Transfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Updates `owner` s allowance for `spender` based on spent `amount`.
     *
     * Does not update the allowance amount in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Might emit an {Approval} event.
     */
    function _spendAllowance(address owner, address spender, uint256 amount) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual {}
}

/**
 * @dev Extension of the {IERC20} interface.
 *
 * This contract extends ERC20 by a "sellable" amount,
 * representing a token amount transferable to a defined contract (DEX / UNISWAP)
 *
 */
abstract contract SellableERC20 is ERC20 {

    mapping(address => uint256) private _sellable;
    uint256 public totalSellable;

    /**
     * @dev NEWLY INTRODUCED
     */
    function sellableOf(address account) public view returns (uint256) {
        return _sellable[account];
    }

      /**
     * @dev Adds `amount` to the `_sellable` of the `account`
     *
     * This internal function raises the sellable token amount of the account.
     *
     * Emits no event.
     *
     * Requirements:
     * - `account` cannot be the zero address.
     */
    function _increaseSellable(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: Sellable to the zero address");

        _sellable[account] += amount;
        totalSellable += amount;
    }

    /**
     * @dev Subtracts `amount` from the `_sellable` of the `account`
     *
     * This internal function decreases the sellable token amount of the account.
     *
     * Emits no event.
     *
     * Requirements:
     * - `account` cannot be the zero address.
     */
    function _decreaseSellable(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: Sellable to zero address");
        unchecked {
            _sellable[account] = _sellable[account] >= amount ? _sellable[account] - amount : 0;
            totalSellable = totalSellable >= amount ? totalSellable - amount : 0;
        }
    }
}

abstract contract Events {

    event StakeStarted(
        bytes16 indexed stakeID,
        address indexed stakerAddress,
        uint256 stakedAmount,
        uint256 stakesShares,
        uint32 indexed startDay,
        uint32 stakingDays
    );

    event StakeEnded(
        bytes16 indexed stakeID,
        address indexed stakerAddress,
        uint256 stakedAmount,
        uint256 stakesShares,
        uint256 rewardAmount,
        uint32 indexed closeDay
    );

    event StakeTransferred(
        bytes16 fromStakeID,
        bytes16 toStakeID,
        address indexed fromStakerAddress,
        address indexed toStakerAddress,
        uint32 indexed currentRxDay
    );

    event RewardsWithdrawn(
        bytes16 indexed stakeID,
        address indexed stakerAddress,
        uint256 withdrawAmount,
        uint32 withdrawDay,
        uint256 stakersPenalty,
        uint32 indexed currentRxDay
    );

    event NewGlobals(
        uint256 totalShares,
        uint256 totalStaked,
        uint256 sharePrice,
        uint32 indexed currentRxDay
    );

    event NewSharePrice(
        uint256 newSharePrice,
        uint32 indexed currentRxDay
    );
}

abstract contract Global is SellableERC20, Events {

    struct Globals {
        uint256 totalStaked;
        uint256 totalShares;
        uint256 sharePrice;
        uint32 currentRxDay;
    }

    Globals public globals;

    constructor() {
        globals.sharePrice = 1E17;   // start price = 0.1 REX
    }

    function _increaseGlobals(
        uint256 _staked,
        uint256 _shares
    )
        internal
    {
        unchecked {
            globals.totalStaked += _staked;
            globals.totalShares += _shares;
        }
        _logGlobals();
    }

    function _decreaseGlobals(
        uint256 _staked,
        uint256 _shares
    )
        internal
    {
        globals.totalStaked =
        globals.totalStaked > _staked ?
        globals.totalStaked - _staked : 0;

        globals.totalShares =
        globals.totalShares > _shares ?
        globals.totalShares - _shares : 0;

        _logGlobals();
    }

    function _logGlobals()
        private
    {
        emit NewGlobals(
            globals.totalStaked,
            globals.totalShares,
            globals.sharePrice,
            globals.currentRxDay
        );
    }
}

abstract contract Declaration is Global {

    uint256 public LAUNCH_TIME;                               // desired beginning of DAY 0
    uint256 public constant SECONDS_IN_DAY = 86400 seconds;

    IUniswapV2Router02 public constant UNISWAP_ROUTER = IUniswapV2Router02(0x165C3410fC91EF562C50559f7d2289fEbed552d9);


    address public SAC_CONTRACT;         // defined later via init after deployment
    address internal NFTSTAKING_CONTRACT;  // defined later via init after deployment
    address public NFT_CONTRACT;         // defined later via init after deployment
    address internal TRAIT_CONTRACT;       // defined later via init after deployment
    address internal AIRDROP_CONTRACT;     // defined later via init after deployment
    address internal LIQUIDITY_CONTRACT;   // defined later via init after deployment
    IREXDEX internal DEX_CONTRACT;         // defined later via init after deployment
    ITREX public TREX_TOKEN;             // defined later via init after deployment

    constructor() {
        // LAUNCH_TIME defines beginning of "DAY 0"
        // REX DAY 1 is the relevant date for interaction
        // which is GMT: Friday, February 23, 2024 6:00:00 PM
        LAUNCH_TIME = 1708624800;
    }

    struct Stake {
        uint256 stakesShares;
        uint256 stakedAmount;
        uint256 rewardAmount;
        uint32 startDay;
        uint32 stakingDays;
        uint32 finalDay;
        uint32 closeDay;
        uint32 withdrawDay;
        uint8 isActive; // 0=inactive (ended) 1=ACTIVE 2=offered_on_DEX (inactive) 3=sold_on_DEX (inactive) 4=transferred_away (inactive)
        bool isTrex;
        string description;
    }

    mapping(address => uint256) public stakeCount;
    mapping(address => uint256) public totalREXinActiveStakes;
    mapping(address => uint256) public totalSHARESinActiveStakes;
    mapping(address => mapping(bytes16 => Stake)) public stakes;
    mapping(address => mapping(bytes16 => uint256)) public withdraws;
    mapping(address => mapping(bytes16 => uint256)) public initialShares;
    mapping(uint32 => uint256) public scheduledToEnd;
}

abstract contract Timing is Declaration {

    function currentRxDay() public view returns (uint32) {
        return block.timestamp >= LAUNCH_TIME ? _currentRxDay() : 0;
    }

    function _currentRxDay() internal view returns (uint32) {
        return uint32((block.timestamp - LAUNCH_TIME) / SECONDS_IN_DAY);
    }
}

abstract contract WrexIntegration is Timing {

    address public WREX_TOKEN; // Standard ERC-20 Wrapped REX
    mapping(address => uint256) public sellableReserve;
    event Wrap(address account, uint256 amount);
    event Unwrap(address account, uint256 amount);

    function isWrexActive() public view returns (bool) {
        return _currentRxDay() >= uint32(180);
    }

    function wrap(uint256 amount) external {
        require(_notContract(msg.sender) && msg.sender == tx.origin);
        require(isWrexActive(), "REX: WREX not active");
        require(balanceOf(msg.sender) >= amount && sellableOf(msg.sender) >= amount, "REX: Low balance");
        _decreaseSellable(msg.sender, amount);
        _burn(msg.sender, amount);
        sellableReserve[msg.sender] += amount;
        IWREX(WREX_TOKEN).mintForRex(msg.sender, amount);
        emit Wrap(msg.sender, amount);
    }

    function unwrap(uint256 amount) external {
        require(_notContract(msg.sender) && msg.sender == tx.origin);
        require(IWREX(WREX_TOKEN).balanceOf(msg.sender) >= amount, "REX: WREX balance too small");
        IWREX(WREX_TOKEN).burnForRex(msg.sender, amount);
        _mint(msg.sender, amount);
        _increaseSellable(msg.sender, sellableReserve[msg.sender] >= amount ? amount : sellableReserve[msg.sender]);
        sellableReserve[msg.sender] = sellableReserve[msg.sender] >= amount ? sellableReserve[msg.sender] - amount : 0;
        emit Unwrap(msg.sender, amount);
    }

    function _notContract(address _addr) internal view returns (bool) {
        uint32 size;
        assembly { size := extcodesize(_addr) }
        return (size == 0);
    }
}


abstract contract Helper is WrexIntegration {

    function _toBytes16(uint256 x) internal pure returns (bytes16 b) {
       return bytes16(bytes32(x));
    }

    function generateID(address x, uint256 y, bytes1 z) public pure returns (bytes16 b) {
        b = _toBytes16( uint256(keccak256(abi.encodePacked(x, y, z))));
    }

    function _generateStakeID(address _staker) internal view returns (bytes16 stakeID) {
        return generateID(_staker, stakeCount[_staker], 0x01);
    }

    function stakesPagination(
        address _staker,
        uint256 _offset,
        uint256 _length
    )
        external
        view
        returns (bytes16[] memory _stakes)
    {
        uint256 start = _offset > 0 &&
            stakeCount[_staker] > _offset ?
            stakeCount[_staker] - _offset : stakeCount[_staker];

        uint256 finish = _length > 0 &&
            start > _length ?
            start - _length : 0;

        uint256 i;

        _stakes = new bytes16[](start - finish);

        for (uint256 _stakeIndex = start; _stakeIndex > finish; _stakeIndex--) {
            bytes16 _stakeID = generateID(_staker, _stakeIndex - 1, 0x01);
            if (stakes[_staker][_stakeID].stakedAmount > 0) {
                _stakes[i] = _stakeID; i++;
            }
        }
    }

    function _stakeNotStarted(Stake memory _stake) internal view returns (bool) {
        return _stake.closeDay > 0                // has the staked been closed already? (closeDay > 0)
            ? _stake.startDay > _stake.closeDay   // stake has been closed -> check if the CLOSE was before start day
            : _stake.startDay > _currentRxDay();  // stake hasn't been closed -> check if startDay is greater than current day
    }

    function _daysDiff(uint32 _startDate, uint32 _endDate) internal pure returns (uint32) {
        return _startDate > _endDate ? 0 : _endDate - _startDate;
    }

    function _daysLeft(Stake memory _stake) internal view returns (uint32) {
        return _stake.isActive == 0
            ? _daysDiff(_stake.closeDay, _stake.finalDay)     // for ENDED stakes
            : _daysDiff(_currentRxDay(), _stake.finalDay);    // all other cases
    }

    function _calculationDay(Stake memory _stake) internal view returns (uint32) {
        return _stake.finalDay > globals.currentRxDay ? globals.currentRxDay : _stake.finalDay;  // checking for "globals.currentRxDay" prevents from trying to get values from days that haven't been calculated yet
    }

    function _startingDay(Stake memory _stake) internal pure returns (uint32) {
        return _stake.withdrawDay == 0 ? _stake.startDay : _stake.withdrawDay;  // used in withdrawing rewards and ending stakes: returns the first day after last rewards withdraw day
    }
}

abstract contract Snapshot is Helper {

    struct SnapShot {
        uint256 totalShares;
        uint256 inflationAmount;
        uint256 scheduledToEnd;
    }

    mapping(uint32 => SnapShot) public snapshots;

    /**
     * @notice allows volunteer to offload snapshots
     * to save on gas during next start/end stake
     * where only one day is processed, which is the first unprocessed
     * where days 0 and 1 are not processed, because there is no data
     */
    function manualSnapshotOneDay()
        external
    {
        require(_notContract(msg.sender) && msg.sender == tx.origin);

        if (currentRxDay() >= 2) {                                    // do nothing on days 0 and 1 where nothing happens
            if (currentRxDay() > globals.currentRxDay + 1) {          // snapshot needed? (difference between actual and update day > 2)
                _dailySnapshotPoint(globals.currentRxDay + 1); } }    // update only the first day after last snapshot day
    }

    /**
     * @notice internal function that offloads global values to daily snapshots
     * updates globals.currentRxDay
     * first function call will be for _updateDay == 1
     * (skip day 0, as no REX exist then and no data has to be saved)
     */
    function _dailySnapshotPoint(
        uint32 _updateDay
    )
        internal
    {
        uint256 totalStakedToday = globals.totalStaked;
        uint256 scheduledToEndToday;

        for (uint32 _day = globals.currentRxDay; _day < _updateDay; _day++) {
            if (_day >= 1 && (totalStakedToday > 0 || totalSupply() > 0)) {
                scheduledToEndToday = scheduledToEnd[_day] + snapshots[_day - 1].scheduledToEnd;
                SnapShot memory snapshot = snapshots[_day];
                snapshot.scheduledToEnd = scheduledToEndToday;
                snapshot.totalShares =
                    globals.totalShares > scheduledToEndToday ?
                    globals.totalShares - scheduledToEndToday : 0;

                  // as on day 0 _inflationAmount() might be zero, the day is skipped
                snapshot.inflationAmount =
                    (snapshot.totalShares * 1E18) / _inflationAmount(totalStakedToday, totalSupply());
                snapshots[_day] = snapshot;
            }
            unchecked { globals.currentRxDay++; }
        }
    }

    /**
     * @notice A function for calculating the needed daily inflation to reach the yearly desired inflation
     * 3.69% MORE TOKENS PER YEAR = 0.0000992802501 PER DAY = 992802501 / 1E13
     */
    function _inflationAmount(uint256 _totalStaked, uint256 _totalSupply) private pure returns (uint256) {
        return (_totalStaked + _totalSupply) * 992802501 / 1E13;
    }
}

abstract contract StakingToken is Snapshot {

    /**
     * @notice A function for a staker to create multiple stakes
     * @dev The function only passes address(0) to createStake() as this function reads msg.sender itself
     * @param _stakedAmount Amount of REX staked
     * @param _stakingDays Number of days it is locked
     * @param _description ONE name for all stakes
     */
    function createStakeBatch(
        uint256[] memory _stakedAmount,
        uint32[] memory _stakingDays,
        string calldata _description
    )
        external
    {
        for(uint256 i = 0; i < _stakedAmount.length;) {
            createStake(
                address(0),
                _stakedAmount[i],
                _stakingDays[i],
                _description
            );
            unchecked { i++; }
        }
    }

    /**
     * @notice A function for a staker (not a contract) to create a stake, also used by above batch function
     * but also used by allowed contracts: AIRDROP
     * @param _stakerAdd Address of staker            - ONLY used if called by AIRDROP
     * @param _stakedAmount Amount of REX staked
     * @param _stakingDays Number of days it is locked
     * @param _description One name for all stakes    - ONLY used if called by user
     */
    function createStake(
        address _stakerAdd,
        uint256 _stakedAmount,
        uint32 _stakingDays,
        string calldata _description
    )
        public
    {
        _dailySnapshotPoint(_currentRxDay());

        Stake memory _newStake;
        _newStake.stakingDays = _stakingDays;
        _newStake.startDay = _currentRxDay() + 1;
        unchecked { _newStake.finalDay = _newStake.startDay + _stakingDays; }
        _newStake.isActive = 1;
        _newStake.stakedAmount = _stakedAmount;

        address _staker;

        if (msg.sender == AIRDROP_CONTRACT)
        {
            _staker = _stakerAdd;
        }
        else
        {
            _staker = msg.sender;

            require(_notContract(_staker) && msg.sender == tx.origin, "REX: No contracts");
            require(_stakedAmount >= 1E17, "REX: MIN_STAKE_AMOUNT error");
            require(_stakingDays >= 30 && _stakingDays <= 3653, "REX: stakingDays error");

            _burn(_staker, _stakedAmount);

              // mint the staker 1 PRINCE to count as a "holder" when everything is staked and burnt
            if (ISAC(SAC_CONTRACT).isRexAmountSet() && balanceOf(_staker) == 0) { _mint(_staker, 1); }
        }

          // staked TREX gets 20% discount on SHARE price (results in 25% more SHARES)
        _newStake.stakesShares = TREX_TOKEN.stakedTrex(_staker) > 0
            ? _stakesShares(_stakedAmount, _stakingDays, ((globals.sharePrice * 80) / 100))
            : _stakesShares(_stakedAmount, _stakingDays, globals.sharePrice);

        _newStake.isTrex = TREX_TOKEN.stakedTrex(_staker) > 0;

        if (msg.sender == AIRDROP_CONTRACT) { _newStake.description = unicode'🤴 AIRDROP'; }
        else { _newStake.description = _description; }

        unchecked { totalREXinActiveStakes[_staker] += _stakedAmount; }

        bytes16 stakeID = _generateStakeID(_staker);
        stakes[_staker][stakeID] = _newStake;

        initialShares[_staker][stakeID] = _newStake.stakesShares;
        totalSHARESinActiveStakes[_staker] += _newStake.stakesShares;

        stakeCount[_staker]++;
        _increaseGlobals(_newStake.stakedAmount, _newStake.stakesShares);

        unchecked { scheduledToEnd[_newStake.finalDay] += _newStake.stakesShares; }

        emit StakeStarted(
            stakeID,
            _staker,
            _newStake.stakedAmount,
            _newStake.stakesShares,
            _newStake.startDay,
            _newStake.stakingDays
        );
    }

    /**
    * @notice A function for a staker (not a contract) to end a stake
    * @param _stakeID unique bytes sequence reference to the stake
    */
    function endStake(
        bytes16 _stakeID
    )
        external
    {
        _dailySnapshotPoint(_currentRxDay());

        require(stakes[msg.sender][_stakeID].isActive == 1, "REX: Stake not active");               // only ACTIVE stakes can be "ended"
        require(stakes[msg.sender][_stakeID].finalDay <= _currentRxDay(), "REX: Stake immature");   // immature stakes cannot be ended

        Stake storage _stake = stakes[msg.sender][_stakeID];      // get stake
        _stake.closeDay = _currentRxDay();                        // set closeDay
        ( , _stake.rewardAmount , ) =
            _checkRewardAmountbyID(msg.sender, _stakeID, 0);      // loop calculates rewards/day (for ALL days), reduced if late claim, reduced if rewards withdrawn before
        _stake.isActive = 0;                                      // deactivate

          // keep track of the user's REX in active stakes
        unchecked {
            totalREXinActiveStakes[msg.sender] =
                totalREXinActiveStakes[msg.sender] >= (_stake.stakedAmount) ?
                totalREXinActiveStakes[msg.sender] - _stake.stakedAmount : 0;
            totalSHARESinActiveStakes[msg.sender] =
                totalSHARESinActiveStakes[msg.sender] >= _stake.stakesShares ?
                totalSHARESinActiveStakes[msg.sender] - _stake.stakesShares : 0;
        }

          // mint back the principal (plus rewardAmount)
        uint256 toMint = _stake.stakedAmount + _stake.rewardAmount;
        _mint(msg.sender, toMint);

          // increase sellable tokens
        uint32 fulfilledDaysCapped = _stake.closeDay - _stake.startDay > 500 ? 500 : _stake.closeDay - _stake.startDay;
        _increaseSellable(msg.sender, toMint * uint256(fulfilledDaysCapped) / uint256(500));

        _decreaseGlobals(_stake.stakedAmount, _stake.stakesShares);
        _removeScheduledShares(_stake.finalDay, _stake.stakesShares);

          // When calculating the SharePrice-Update, given TREX bonus must be calculated backwards
          // otherwise the SharePrice would rise more than needed
          // also, the initialShares of the stake is used, not the (possibly) deducted value in _stake.stakesShares
        uint256 stakesSharesCorr = _stake.isTrex     // IF TREX, calculate back the TREX bonus
            ? ((initialShares[msg.sender][_stakeID] * 80) / 100)
            : initialShares[msg.sender][_stakeID];

        _sharePriceUpdate(
            _stake.stakedAmount,
            _stake.rewardAmount + withdraws[msg.sender][_stakeID],
            _stake.stakingDays,
            stakesSharesCorr
        );

        emit StakeEnded(
            _stakeID,
            msg.sender,
            _stake.stakedAmount,
            _stake.stakesShares,
            _stake.rewardAmount,
            _stake.closeDay
        );
    }

    function _removeScheduledShares(
        uint32 _finalDay,
        uint256 _shares
    )
        internal
    {
        if (_finalDay >= _currentRxDay()) {
            scheduledToEnd[_finalDay] =
            scheduledToEnd[_finalDay] > _shares ?
            scheduledToEnd[_finalDay] - _shares : 0;
        } else {
            uint32 _day = _currentRxDay() - 1;
            snapshots[_day].scheduledToEnd =
            snapshots[_day].scheduledToEnd > _shares ?
            snapshots[_day].scheduledToEnd - _shares : 0;
        }
    }

    function _sharePriceUpdate(
        uint256 _stakedAmount,
        uint256 _rewardAmount,
        uint32 _stakingDays,
        uint256 _stakeShares
    )
        internal
    {
        if (_stakeShares > 0 && _currentRxDay() > 3) {

            uint256 newSharePrice = _getNewSharePrice(
                _stakedAmount + _rewardAmount,
                _stakeShares,
                _stakingDays
            );

            if (newSharePrice > globals.sharePrice) {

                newSharePrice =
                    newSharePrice < ((globals.sharePrice * 105) / 100) ?
                    newSharePrice : (globals.sharePrice * 105) / 100;

                emit NewSharePrice(
                    newSharePrice,
                    _currentRxDay()
                );

                globals.sharePrice = newSharePrice;
            }
        }
    }

    function _getNewSharePrice(
        uint256 _tokenAmount,
        uint256 _stakeShares,
        uint32 _stakingDays
    )
        private
        pure
        returns (uint256)
    {
        return ((_tokenAmount * 1E18 * ( 1E10 + _getBonus(_stakingDays) )) / 1E10) / _stakeShares;
    }

    function _stakesShares(
        uint256 _stakedAmount,
        uint32 _stakingDays,
        uint256 _sharePrice
    )
        internal
        pure
        returns (uint256)
    {
        return (((_stakedAmount * 1E18) / _sharePrice) * ( 1E10 + _getBonus(_stakingDays) )) / 1E10;
    }

    function _getBonus(
        uint32 _stakingDays
    )
        private
        pure
        returns (uint256)
    {
        uint32 _days = 0;
        uint32 fullYears = _stakingDays / 365;
        for (uint32 i = 1; i <= fullYears;)
        {
            _days += i * 365;
            unchecked { i++; }
        }
        _days += (_stakingDays - 365 * fullYears) * (fullYears + 1);

        return (uint256(_days) * 1E10) / 1000;
    }

    function _checkStakeDataByID(address _staker, bytes16 _stakeID) external view returns (bool, uint32, uint32, uint256, uint256) {
        return (stakes[_staker][_stakeID].isTrex, stakes[_staker][_stakeID].startDay, stakes[_staker][_stakeID].finalDay, stakes[_staker][_stakeID].stakesShares, stakes[_staker][_stakeID].stakedAmount);
    }

    /**
    * @notice A public function to calculate the accumulated REWARDS of a STAKE (in any state)
    * @dev Returns paid rewards of ENDED stakes, 0 for SOLD and TRANSFERRED stakes, withdrawable rewards for ACTIVE/OFFERED stakes
    * @param _staker Owner of the stake
    * @param _stakeID unique bytes sequence reference to the stake of the owner
    * @param _withdrawDays Number of days to calculate in case of withdrawal of rewards, 0 for ALL days
    */
    function _checkRewardAmountbyID(
        address _staker,
        bytes16 _stakeID,
        uint32 _withdrawDays
    )
        public
        view
        returns (uint32 _withdrawDay, uint256 rewardAmount, uint256 sharesPenalty)
    {
        Stake memory stake = stakes[_staker][_stakeID];

        if (stake.isActive == 0) { return (0, stake.rewardAmount, 0); }        // ended stake - return saved rewardAmount
        if (stake.startDay > _currentRxDay()) { return (0, 0, 0); }            // stake not started - return 0
        if (stake.isActive == 3 || stake.isActive == 4) { return (0, 0, 0); }  // stake transferred or sold - return 0

        if (_currentRxDay() >= stake.finalDay)
        {
            // the stake is ACTIVE (or still OFFERED on DEX) and MATURE - calculate rewards for ALL past days and deduct LATE penalty on rewards (if applicable)
            // Withdrawing rewards is not possible at this point, so there are no penalties for shares
            // if rewards have been withdrawn before, this is regarded by using _startingDay(stake)

            uint32 _finalDay = _calculationDay(stake);

            rewardAmount = _loopRewardAmount(
                stake.stakesShares,
                _startingDay(stake),
                _finalDay
            );

              // LATE CLAIM: deduct REWARDS penalty of 1%/week, if claimed more than 14 days after finalDay
            if (_currentRxDay() > (_finalDay + uint32(14)) && rewardAmount > 0) {
                uint256 _reductionPercent = ((uint256(_currentRxDay()) - uint256(_finalDay) - uint256(14)) / uint256(7)) + uint256(1);
                if (_reductionPercent > 100) { _reductionPercent = 100; }
                rewardAmount = (rewardAmount * (uint256(100) - _reductionPercent)) / 100;
            }
            return (0, rewardAmount, 0);
        }
        else
        {
            // now, the stake must be ACTIVE or OFFERED on DEX, already started and not mature:
            // calculate the withdrawable rewardAmount and the sharesPenalty that would be deducted

            _withdrawDay = _withdrawDays > 0               // startingDay returns stake.startDay OR stake.withdrawDay (if withdrawn already)
                ? (_startingDay(stake) + _withdrawDays)    // if not all days shall be withdrawn, add desired days to startingDay
                : _calculationDay(stake);                  // calculationDay returns latest possible day to withdraw (calculated day))

            _withdrawDay = _withdrawDay > _currentRxDay()  // as _withdrawDay might still exceed currrentDay, limit to currentDay
                ? _calculationDay(stake)
                : _withdrawDay;

            if ( _withdrawDay <= _startingDay(stake))      // if _withdrawDay is not greater than _startingDay all possible rewards have already been fetched
            {
                return (0, 0, 0);
            }

            rewardAmount = _loopRewardAmount(              // startingDay returns stake.startDay OR stake.withdrawDay (if withdrawn before)
                stake.stakesShares,
                _startingDay(stake),
                _withdrawDay
            );

              // calculate penalty - shares that would be deducted (if there are any rewards)
              // this part is only for when rewards are being withdrawn
              // deduct the shares, that the user would get, when creating a new stake for the remaining days (@ current SharePrice)

            if (rewardAmount > 0)
            {
                sharesPenalty = _stakesShares(
                    rewardAmount,
                    _daysLeft(stake),
                    stake.isTrex ? ((globals.sharePrice * 80) / 100) : globals.sharePrice
                );
            }
            else
            {
                return (0, 0, 0);
            }

            return (_withdrawDay, rewardAmount, sharesPenalty);
        }
    }

    function _loopRewardAmount(
        uint256 _stakeShares,
        uint32 _startDay,
        uint32 _finalDay
    )
        internal
        view
        returns (uint256 _rewardAmount)
    {
          // calculate rewards / day
        unchecked {
            for (uint32 _day = _startDay; _day < _finalDay; _day++) {
                _rewardAmount += (_stakeShares * 1E18) / snapshots[_day].inflationAmount;
            }
        }
    }
}

abstract contract ExtendedStaking is StakingToken {

    /**
    * @notice A function for a staker (not a contract) to transfer an active stake,
    * belonging to his address by providing the stake ID, to another address (not a contract).
    * @param _stakeID unique bytes sequence reference to the stake
    * @param _toAddress Receiver of the stake
    */
    function transferStake(
        bytes16 _stakeID,
        address _toAddress
    )
        external
    {
        require(_notContract(msg.sender) && msg.sender == tx.origin);

        _dailySnapshotPoint(_currentRxDay());

        require(stakes[msg.sender][_stakeID].isActive == 1, "REX: Stake not active");
        require(_toAddress != msg.sender, "REX: Same address");
        require(_notContract(_toAddress), "REX: Receiver not an address");

        Stake memory _temp = stakes[msg.sender][_stakeID];
        Stake memory _newStake;

        _newStake.stakesShares = _temp.stakesShares;
        _newStake.stakedAmount = _temp.stakedAmount;
        _newStake.startDay = _temp.startDay;
        _newStake.stakingDays = _temp.stakingDays;
        _newStake.finalDay = _temp.finalDay;
        _newStake.isActive = 1;
        _newStake.withdrawDay = _temp.withdrawDay;
        _newStake.isTrex = _temp.isTrex;
        _newStake.description = _temp.description;

          // save the new stake for the new staker (toAddress)
        bytes16 _newReceiverStakeID = _generateStakeID(_toAddress);
        stakes[_toAddress][_newReceiverStakeID] = _newStake;
        unchecked { stakeCount[_toAddress]++; }

        Stake storage _stake = stakes[msg.sender][_stakeID];
        _stake.closeDay = _currentRxDay();
        _stake.isActive = 4;

        if (_temp.withdrawDay > 0) {
            withdraws[_toAddress][_newReceiverStakeID] = withdraws[msg.sender][_stakeID];
        }
        initialShares[_toAddress][_newReceiverStakeID] = initialShares[msg.sender][_stakeID];

          // transfer staked amount to the new staker (sub and add)
        totalREXinActiveStakes[msg.sender] = totalREXinActiveStakes[msg.sender] > _temp.stakedAmount ?
            totalREXinActiveStakes[msg.sender] - _temp.stakedAmount : 0;
        unchecked { totalREXinActiveStakes[_toAddress] += _temp.stakedAmount; }

        totalSHARESinActiveStakes[msg.sender] =
            totalSHARESinActiveStakes[msg.sender] >= _temp.stakesShares ?
            totalSHARESinActiveStakes[msg.sender] - _temp.stakesShares : 0;
        unchecked { totalSHARESinActiveStakes[_toAddress] += _temp.stakesShares; }

        emit StakeTransferred(_stakeID, _newReceiverStakeID, msg.sender, _toAddress, _currentRxDay());
    }

    /**
    * @notice A function for a staker to rename a stake
    * belonging to his address by providing the stake ID
    * @param _stakeID unique bytes sequence reference to the stake
    * @param _description New description
    */
    function renameStake(
        bytes16 _stakeID,
        string calldata _description
    )
        external
    {
        _dailySnapshotPoint(_currentRxDay());

        require(stakes[msg.sender][_stakeID].isActive == 1, "REX: Stake not active");

        Stake storage _stake = stakes[msg.sender][_stakeID];    // get the stake
        _stake.description = _description;                      // change description
    }

    /**
    * @notice allows a staker (not a contract) to withdraw staking rewards from active stake
    * @param _stakeID unique bytes sequence reference to the stake
    * @param _withdrawDays number of days to process (from the beginning / last withdraw day), all possible days = 0
    */
    function withdrawRewards(
        bytes16 _stakeID,
        uint32 _withdrawDays
    )
        external
        returns (
            uint32 withdrawDay,
            uint256 withdrawAmount,
            uint256 stakersPenalty
        )
    {
        _dailySnapshotPoint(_currentRxDay());

        require(stakes[msg.sender][_stakeID].isActive == 1, "REX: Stake not active");                     // only if stake is active
        require(_currentRxDay() > (stakes[msg.sender][_stakeID].startDay + 27), "REX: Stake too young");  // stake must have passed 4 weeks
        require(stakes[msg.sender][_stakeID].finalDay > _currentRxDay(), "REX: Stake is mature");         // only if stake is immature

        Stake memory stake = stakes[msg.sender][_stakeID];  // get stake

        (withdrawDay, withdrawAmount, stakersPenalty) = _checkRewardAmountbyID(msg.sender, _stakeID, _withdrawDays);
        require(withdrawAmount > 0, "REX: Withdraw amount zero");

        uint256 _sharesTemp = stake.stakesShares;  // save current stakesShares in _sharesTemp

          // deduct penalty from SHARES
        stake.stakesShares =
            stake.stakesShares > stakersPenalty ?
            stake.stakesShares - stakersPenalty : 0;

          // keep track of the scheduled shares: deduct from final day - then log globals
        _removeScheduledShares(stake.finalDay, stakersPenalty > _sharesTemp ? _sharesTemp : stakersPenalty);
        _decreaseGlobals(0, _sharesTemp > stakersPenalty ? stakersPenalty : _sharesTemp);

          // deduct penalty from users total SHARES
        totalSHARESinActiveStakes[msg.sender] -= (_sharesTemp > stakersPenalty ? stakersPenalty : _sharesTemp);

          // keep track of withdraws for sharePriceUpdate when calling _endStake
        unchecked { withdraws[msg.sender][_stakeID] += withdrawAmount; }

        stake.withdrawDay = withdrawDay;
        stakes[msg.sender][_stakeID] = stake;

        _mint(msg.sender, withdrawAmount);
        _increaseSellable(msg.sender, withdrawAmount);

        emit RewardsWithdrawn(_stakeID, msg.sender, withdrawAmount, withdrawDay, stakersPenalty, _currentRxDay());
    }
}

abstract contract DexToken is ExtendedStaking {

    mapping(address => bool) public hasActiveOffer; // track active offers, only 1 allowed at a time

    /**
    * @notice A function for a staker (not a contract) to offer an active stake on the REX STAKES DEX for 14 days, possible from day 30
    * @param _stakeID unique bytes sequence reference to the stake
    * @param _price of the stake in PLS
    */
    function offerStake(
        bytes16 _stakeID,
        uint256 _price
    )
        external
    {
        _dailySnapshotPoint(_currentRxDay());

        /// require price/timing limits
        require(_price >= 10E23, "REX: Min price is 100k PLS");     // 100,000 PLS min price
        require((_currentRxDay() + 14) < stakes[msg.sender][_stakeID].finalDay, "RX: Stake ending too soon");
        require(_currentRxDay() >= (((stakes[msg.sender][_stakeID].stakingDays * 10) / 100) + stakes[msg.sender][_stakeID].startDay), "REX: Stake too young");
        require(_currentRxDay() >= 30, "REX: Too early");
        require(stakes[msg.sender][_stakeID].isActive == 1, "REX: Stake not active");
        require(!hasActiveOffer[msg.sender], "REX: Only 1 offer");

        // track active offer
        hasActiveOffer[msg.sender] = true;

        /// temporarily deactivate stake to prevent from usage (isActive = 2)
        /// do this before "listStake" on DEX (reentrancy) - in the next step
        Stake storage _stake = stakes[msg.sender][_stakeID];
        _stake.isActive = 2;

        /// sent data to DEX
        DEX_CONTRACT.listStake(msg.sender, _currentRxDay(), _price, _stakeID);
    }

    /**
    * @notice A function for the DEX to restore a stake
    * @dev Triggered by the user in DEX contract
    */
    function restoreStake(
        address _staker,
        bytes16 _stakeID
    )
        external
    {
        _dailySnapshotPoint(_currentRxDay());

        require(msg.sender == address(DEX_CONTRACT));

        Stake storage _stake = stakes[_staker][_stakeID];  // get the stake
        _stake.isActive = 1;

        hasActiveOffer[_staker] = false;
    }

    /**
    * @notice A function for the DEX to create a stake
    * belonging to _fromAddress by providing the stake ID, to _toAddress.
    * @dev Triggered by the user in DEX contract
    * @param _stakeID unique bytes sequence reference to the stake
    * @param _fromAddress Seller of the stake
    * @param _toAddress Buyer of the stake
    */
    function createBoughtStake(
        bytes16 _stakeID,
        address _fromAddress,
        address _toAddress
    )
        external
    {
        _dailySnapshotPoint(_currentRxDay());

        require(msg.sender == address(DEX_CONTRACT));

        Stake memory _temp = stakes[_fromAddress][_stakeID];
        Stake memory _newStake;

        _newStake.stakesShares = _temp.stakesShares;
        _newStake.stakedAmount = _temp.stakedAmount;
        _newStake.startDay = _temp.startDay;
        _newStake.stakingDays = _temp.stakingDays;
        _newStake.finalDay = _temp.finalDay;
        _newStake.isActive = 1;
        _newStake.withdrawDay = _temp.withdrawDay;
        _newStake.isTrex = _temp.isTrex;
        _newStake.description = unicode'BOUGHT on MARKET';

          // save the new stake for the buyer (toAddress)
        bytes16 _newReceiverStakeID = _generateStakeID(_toAddress);
        stakes[_toAddress][_newReceiverStakeID] = _newStake;
        unchecked { stakeCount[_toAddress]++; }

        Stake storage _stake = stakes[_fromAddress][_stakeID];
        _stake.closeDay = _currentRxDay();
        _stake.isActive = 3;
        hasActiveOffer[_fromAddress] = false;

        if (_temp.withdrawDay > 0) {
            withdraws[_toAddress][_newReceiverStakeID] = withdraws[_fromAddress][_stakeID];
        }
        initialShares[_toAddress][_newReceiverStakeID] = initialShares[_fromAddress][_stakeID];

          // transfer staked amount to the new staker (sub and add)
        unchecked {
            totalREXinActiveStakes[_fromAddress] = totalREXinActiveStakes[_fromAddress] > _temp.stakedAmount ?
                (totalREXinActiveStakes[_fromAddress] - _temp.stakedAmount) : 0;
            totalREXinActiveStakes[_toAddress] += _temp.stakedAmount;

            totalSHARESinActiveStakes[_fromAddress] =
                totalSHARESinActiveStakes[_fromAddress] >= _temp.stakesShares ?
                totalSHARESinActiveStakes[_fromAddress] - _temp.stakesShares : 0;
            totalSHARESinActiveStakes[_toAddress] += _temp.stakesShares;
        }

        emit StakeTransferred(_stakeID, _newReceiverStakeID, _fromAddress, _toAddress, _currentRxDay());
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


abstract contract NftToken is DexToken, ReentrancyGuard {

    bool internal isInternalTx;

    function buyForTreasury() external payable {
        require(msg.sender == INFTSTAKE(NFTSTAKING_CONTRACT).market() || msg.sender == address(DEX_CONTRACT));
        _instaBuy(msg.value);
    }

    function bulkMintNft(address to, uint256 count) nonReentrant external payable {
        require(ISAC(SAC_CONTRACT).isRexAmountSet(), "No liquidity yet");
        require(to != address(0), "valid address required");
        require(count >= 1 && count <= 100, "count must be 1 to 100");
        require(msg.value == INFT(NFT_CONTRACT).mintPriceMany(count), "total mint price not met");

        _dailySnapshotPoint(_currentRxDay());
        _instaBuy(msg.value);

        for (uint i=0; i < count; i++) {
           INFT(NFT_CONTRACT).safeMint(to);
        }
        INFTTrait(TRAIT_CONTRACT).add(count);  // calc traits
    }

    function _instaBuy(uint256 amount) private {
        // buy REX immediately and send to the treasury (nftStaking)
        address[] memory path = new address[](2);
        path[0] = UNISWAP_ROUTER.WPLS();
        path[1] = address(this);
        isInternalTx = true;
        UNISWAP_ROUTER.swapExactETHForTokensSupportingFeeOnTransferTokens{value:amount}(0, path, NFTSTAKING_CONTRACT, block.timestamp + 60 seconds);
        isInternalTx = false;
    }
}


abstract contract TransferToken is NftToken {

    IUniswapV2Pair public PAIR;
    uint256 public totalBurn;

    function setInternal(bool inter) external {
        require(
          msg.sender == SAC_CONTRACT ||
          msg.sender == NFTSTAKING_CONTRACT ||
          msg.sender == LIQUIDITY_CONTRACT
        );
        isInternalTx = inter;
    }

    function _transfer(address from, address to, uint256 amount) internal override {
        require(amount > 0, "REX: Amount zero");
        uint256 remainingAmount = amount;

        if(!isInternalTx) {

            /// PURE STAKING:
            /// no Txns allowed between 2 EOAs or contracts,
            require((_notContract(to) && !_notContract(from)) || (!_notContract(to) && _notContract(from)), "REX: No contract to contract or EOA to EOA");

            /// a Tx to an EOA must come from the PAIR (i.e. a BUY Tx)
            if (_notContract(to)) {
                require(from == address(PAIR), "REX: Only from PAIR");
            }

            /// a Tx from an EOA to a contract must go to the PAIR (i.e. a SELL Tx)
            if (_notContract(from)) {
                require(to == address(PAIR), "REX: Only to PAIR");
            }

            /// BUY / SELL / Wallet Tx: 0.8% fee => 0.5% for NFT user rewards + 0.3% burn
            uint256 feeNft = (remainingAmount * 5) / 1000;
            uint256 feeBurn = (remainingAmount * 3) / 1000;
            super._transfer(from, NFTSTAKING_CONTRACT, feeNft);
            _burn(from, feeBurn);
            totalBurn += feeBurn;
            unchecked {
                remainingAmount = (remainingAmount - feeNft) - feeBurn;
            }

            /// when selling, the msg.sender must have enough "sellable" tokens and the amount must be deducted
            if (to == address(PAIR)) {
                /// the full "amount" is required to be "sellable" (including the fees), not only the "remainingAmount"
                require(sellableOf(from) >= amount, "REX: Not enough sellable tokens");
                _decreaseSellable(from, amount);
            }
        }
        super._transfer(from, to, remainingAmount);
    }
}


contract PlsRexMain is TransferToken {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() ERC20("REX", "REX") {
        owner = msg.sender;
    }

    /**
     * @notice A function to init REX contracts
     */
    function init(address _AIR, address _SAC, address _DEX, address _TREX, address _NFT, address _NFTS, address _TRAIT, address _LIQ, address _WREX) external {
        require(msg.sender == owner);
        AIRDROP_CONTRACT = _AIR;
        SAC_CONTRACT = _SAC;
        DEX_CONTRACT = IREXDEX(_DEX);
        TREX_TOKEN = ITREX(_TREX);
        PAIR = IUniswapV2Pair(IUniswapV2Factory(UNISWAP_ROUTER.factory()).createPair(address(this), UNISWAP_ROUTER.WPLS()));
        NFTSTAKING_CONTRACT = _NFTS;
        NFT_CONTRACT = _NFT;
        TRAIT_CONTRACT = _TRAIT;
        LIQUIDITY_CONTRACT = _LIQ;
        WREX_TOKEN = _WREX;
        address previousOwner = owner;
        owner = address(0);
        emit OwnershipTransferred(previousOwner, owner);
    }

    /**
     * @notice Allows external SAC_CONTRACT and NFTSTAKING_CONTRACT
     * to mint REX tokens for sacrificers and initial liquidity and NFT STAKERS
     * @dev executed from SAC_CONTRACT or NFTSTAKING_CONTRACT only
     * @param account to mint REX to
     * @param amount of REX to mint
     */
    function mintAsSubcontract(address account, uint256 amount) external {
        require(msg.sender == SAC_CONTRACT || msg.sender == NFTSTAKING_CONTRACT);
        _mint(account, amount);
    }

    /**
     * @notice Allows external contracts to increase the sellable amount of an account
     * @dev executed from LIQUIDITY_CONTRACT or NFTSTAKING_CONTRACT only
     * @param _account to mint REX to
     * @param _amount of REX to mint
     */
    function addSellable(address _account, uint256 _amount) external {
        require(msg.sender == NFTSTAKING_CONTRACT || msg.sender == LIQUIDITY_CONTRACT);
        _dailySnapshotPoint(_currentRxDay());
        _increaseSellable(_account, _amount);
    }
}
