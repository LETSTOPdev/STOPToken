
Project Overview
  1. Functional Requirements
    1.1. Roles
    1.2. Features
    1.3. Use Cases
  2. Technical Requirements


# Project Overview

LETSTOP ERC20 Token.
This token is a part of LETSTOP strategy to reward safer drivers.
LETSTOP will issue tokens to:
  1 - investors, according to the specific vesting plan
  2 - users, according to their driving score with some additional parameter

# 1. Functional Requirements
#   1.1. Roles
    LETSTOP token has 2 roles:
      1 - Owner: Control the minting functionality and can transfer the ownership to another address
      2 - User: Can hold and transfer tokens according to ERC20 standards

#   1.2. Features
    LETSTOP token has the following features:
      * Limit the number of tokens to the specified maximal supply - 100 milion with 18 decimals
      * Ownership transfer according to openzeppelin 2-step ownership transfer
      * ERC20 standard features:
        - Transfer account funds
        - Approve another to transfer account funds 
        - Transfer funds from another account upon approval
      * Mint tokens to single or multiple accounts, by owner only

#   1.3. Use Cases
      1 - A user can transfer funds from self or from another account to trade or to use the tokens to make a purchase
          in LETSTOP application
      2 - An admin can mint tokens into one or more accounts to reward investors and drivers or to make company payments
      3 - An admin transfers the contract ownership, the new owner accept the transfer to finalize it

# 2. Technical Requirements
    This project has been developed with Solidity language, using Hardhat as a
    development environment. Javascript is the selected language for testing and
    scripting.

    Inside the ./contracts folder, STOPToken.sol contains the smart contract
    with the vesting token functionality explained in section 2.2 of this document.

# 2.1. Contract Information
    This section contains detailed information (purpose, functions,
    and events) about the contract used in the project.

#   2.1.1 STOPToken.sol
      A mintable & ownable ERC20 token.
      Typical flows looks as follows:

      Contract deployment
        The contract is deployed, specifying the admin's address who is basically the minter of the contract. In the
        constructor, the maximal supply is set to 100 milion with 18 decimals and the name & symbol are set to STOP.

      Token minting
        The admin mints tokens into one or more accounts, under the restrictions of the maximal supply.

      Transfer approval
        User/account approve another user/account to transfer tokens on it's behalf.

      token transfers
        A user transfer tokens from own or another's account.

      Ownership transfer
        1. The owner transfers the ownership to another account using the "transferOwnership" function, the new
           account is now a pending owner.
        2. The pending owner complete the ownership transfer by using the "acceptOwnersip" function and became the new owner.

      Getter functions
        Additionally, there are different getter functions, that can be called to
        retrieve relevant data from the contract:
        - symbol() -> returns the token symbol (STOP).
        - name() -> returns the token name (STOP).
        - decimals() -> returns the number of decimals (18).
        - totalSupply() -> returns the number of already minted tokens.
        - balanceOf(account) -> returns the tokens balance of an account.
        - allowance(owner, spender) -> returns the allowance the owner provided the spender.
        - pendingOwner() -> returns the pending-owner's address.
        - owner() -> returns the current owner address.
        - cap() -> returns the maximal possible number of tokens

        2.1.1.1. Events
          All openzeppelin's ERC20Capped & Ownable2Step events, nothing was added

        2.1.1.2. Modifiers
          All openzeppelin's ERC20Capped & Ownable2Step modifiers, nothing was added

        2.1.1.3. Functions
          All openzeppelin's ERC20Capped & Ownable2Step functions, in addition:
          * constructor: sets the contract owner address, the maximal supply, the token name and the token symbol
          * mint: mint a specified number of tokens to a given address, using the _mint inherited function
          * batchMint: verifies that it was given arrays of addresses and values in an identical length,
            then mint the tokens to the list of addresses according to the given values
