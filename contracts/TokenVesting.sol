// contracts/TokenSale.sol
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSale {
    address public admin;
    IERC20 public token;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(address _tokenAddress, uint256 _tokenPrice) {
        admin = msg.sender;
        token = IERC20(_tokenAddress);
        tokenPrice = _tokenPrice;
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == _numberOfTokens * tokenPrice, "Incorrect value sent");
        require(token.balanceOf(address(this)) >= _numberOfTokens, "Not enough tokens in the contract");
        
        tokensSold += _numberOfTokens;
        emit Sell(msg.sender, _numberOfTokens);
        
        token.transfer(msg.sender, _numberOfTokens);
    }

    function endSale() public {
        require(msg.sender == admin, "Only admin can end the sale");
        require(token.transfer(admin, token.balanceOf(address(this))), "Transfer failed");
        selfdestruct(payable(admin));
    }
}
