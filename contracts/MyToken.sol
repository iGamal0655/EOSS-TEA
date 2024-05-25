// contracts/MyToken.sol
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Functionality to lock tokens for a specific account
    mapping(address => uint256) public lockedTokens;

    function lockTokens(address account, uint256 amount) public onlyOwner {
        require(amount <= balanceOf(account), "Insufficient balance");
        lockedTokens[account] += amount;
    }
}
