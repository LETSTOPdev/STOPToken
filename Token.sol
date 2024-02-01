
// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.9/contracts/access/Ownable2Step.sol";

contract Token is ERC20Capped, Ownable2Step {
    
    uint256 constant _maximalSupply = 10 ** 18 * 1000 * 1000 * 100;

    constructor(address initialOwner) ERC20("lique", "LIQEO") ERC20Capped(_maximalSupply) {
        _transferOwnership(initialOwner);
    }

    // any attempt to mint beyond the cap limit will be reverted as a result of the ERC20Capped logic
    function mint(address account, uint256 value) onlyOwner public {
        _mint(account, value);
    }
    
    // 1 - any attempt to mint beyond the cap limit will be reverted as a result of the ERC20Capped logic
    // 2 - be careful not to send here zero-values, as it will consume a lot of gas and may revert the execution
    // 3 - this function is infinite in gas consumption, and can fail if trying to mint into too many accounts
    function batchMint(address[] calldata accounts, uint256[] calldata values) onlyOwner public {
        require(accounts.length == values.length, "Inconsistent batch size");

        for(uint256 i = 0; i < accounts.length; i++) {
            _mint(accounts[i], values[i]);
        }
    }
}
