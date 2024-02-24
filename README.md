# rex-pls-source
REX on PulseChain

# Overview
This document provides a quick overview about the contracts.

# Contracts
REX is a set of 14 smart contracts: 
1. REX ["REX"] (main staking token - as seen before - introducing "sellableOf" and fees and WREX)
2. STAKE MARKET (a "DEX" for REX STAKES - as seen before as "DEX")
3. TREX ["TREX"] (a support token including TREX airdrop - as seen before)
4. WREX ["Wrapped REX"] (a Wrapped REX - Standard ERC-20 - mintable/burnable by REX main token)
5. NFT (an ERC-721 NFT called "REXAGOTCHI" - extended with "plsStored" - a mod of audited ElephantMoney contract)
6. NFT STAKING (a contract to stake and feed the NFT - a mod of audited ElephantMoney contract)
7. NFT MARKET (a contract to stake and buy/sell the NFT - a mod of audited ElephantMoney contract)
8. NFT TRAIT (a contract to track rarity of the NFT - audited ElephantMoney contract)
9. SAC / SACRIFICE (an adoption of former AUCTIONS contract - possibility to SAC for REX)
10. LIQUIDITY (an adoption of former AUCTIONS contract - possibility to provide liquidity for rewards)
11. AIRDROP (BSC-REX users may claim 10 REX STAKES - as seen before)
12. AIRDROP ADDRESSES (a contract holding the list of airdrop receivers - used in AIRDROP)
13. REX PAIR (automatically generated AMM - pair for REX/PLS)
14. TREX PAIR (automatically generated AMM - pair for TREX/PLS)

# Contract adresses
1. REX: 0x538B1BA51458565e553264c7F00d6De3806Aa9D9
2. STAKE MARKET: 0x4c141A02955277E317Acdfeed4CCF8C381aF2C1f
3. TREX: 0x955Cfb218AE529De48dd1CD3A4D94d1Eb5B7163D
4. WREX: 0xAeA81f31D5a1623FC051475F3Ba4bA6CED32467b
5. NFT: 0x8C25fC77F4DA71B7cC6350a2674013563a4FA946
6. NFT STAKING: 0x3Fb047d98dfb95b0d42E9E29D64C934adb9DF74A
7. NFT MARKET: 0x0795FA2bAcECBe508D0928F4eEDb1d22825F7bEa
8. NFT TRAIT: 0x704CF4b45C3B96Cfa9a7D6ac98262011c7635A54
9. SAC: 0xd406686230a3c827863DE4ae2967737EBda239FA
10. LIQUIDITY: 0x108d9E03Bec333813AD2e2B1218F485ADe86547B
11. AIRDROP: 0x9e066224a2fb3FA3fEC2A39809B4B7Aec954dfcA
12. AIRDROP ADDRESSES: 0x4f41Dc5299cd43420e3223183f822d11FaE6f0F3
13. REX PAIR: 0x8aA4871e6Aba19974869Bf635bF81f008185080E
14. TREX PAIR: 0x0791240d989c8Bb8de522e04cb48A7D3e1b0ab76

# NO-NEW-FULL-AUDIT-WARNING
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

