# rex-pls-source
REX on PulseChain

# Overview
This document provides a quick overview about the contracts.

# Contracts
REX is a set of 13 smart contracts: 
1. REX ["REX"] (main staking token - as seen before - introducing "sellableOf" and fees and WREX)
2. STAKE MARKET (a DEX for REX STAKES - as seen before as "DEX")
3. TREX ["TREX"] (a support token including TREX airdrop - as seen before)
4. WREX ["Wrapped REX"] (a Wrapped REX - Standard ERC-20 - mintable/burnable by REX main token)
5. AIRDROP (free stakes for certain BSC-REX users - as seen before)
6. SAC / SACRIFICE (an adoption of former AUCTIONS contract - possibility to SAC for REX)
7. LIQUIDITY (an adoption of former AUCTIONS contract - possibility to provide liquidity for rewards)
8. AIRDROP (BSC-REX users may claim 10 REX STAKES - as seen before)
9. NFT (an ERC-721 NFT called "REXAGOTCHI" - extended with "plsStored" - a mod of audited ElephantMoney contract)
10. NFT STAKING (a contract to stake and feed the NFT - a mod of audited ElephantMoney contract)
11. NFT MARKET (a contract to stake and buy/sell the NFT - a mod of audited ElephantMoney contract)
12. NFT TRAIT (a contract to track rarity of the NFT - audited ElephantMoney contract)
13. AIRDROP ADDRESSES (a contract holding the list of airdrop receivers - used in AIRDROP)

# NO-FULL-AUDIT-WARNING
There is no new full audit for PLS-REX, as it is not affordable at the moment.
PLS-REX uses the contracts of BSC-REX, which are triple-audited (Certik+SF+TechRate) and run flawlessly on BSC.
Added contracts and functions have been taken from audited contracts, namely the NFT contracts and fee functions in REX.
All functions have been tested on Pulsechain main net, in a dozen+ runs (internal audits + hackathons).
Users are adviced to run their own audits before interacting. The are no guarantuees whatoever. 

# WHITEPAPER
[https://pls-rex.io/paper](https://pls-rex.io/paper/)

# SAC functionality
[https://pls-rex.io/sac/](https://pls-rex.io/sac/)

# AIRDROP functionality
[https://pls-rex.io/airdrop/](https://pls-rex.io/airdrop/)

# NETWORK
Network Name: PulseChain
RPC URL: https://rpc.pulsechain.com
Chain ID: 369
Currency Symbol: PLS
Block Explorer: https://otter.pulsechain.com

# TOOLS
Deploy: http://remix.ethereum.org
Block Explorer: https://scan.pulsechain.com/

# Compiler 0.8.19 
EVM version: default
optimizer on 
optimizer-runs 1 

# Website - Main entry point
[https://pls-rex.io/](https://pls-rex.io/)

# App - Interaction with contracts
[https://app.pls-rex.io/](https://app.pls-rex.io/)

# Devs contact person
+ Thomas Rexroth
+ TG: https://t.me/Thomas_REX_ROTH
+ E-mail: go@rex-token.com

