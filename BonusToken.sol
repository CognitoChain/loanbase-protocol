// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract BonusToken is ERC20
{
    address public admin;
    address public liquidator;
    
    
    constructor(string memory name_, string memory symbol_)ERC20(name_,symbol_)
    {
        
        admin=msg.sender;
    }
    
    function setLiquidator(address _liquidator) external
    {
        require(msg.sender==admin,'only admin');
        liquidator = _liquidator;
    }
    
    function mint(address to , uint amount ) external{
        require(msg.sender==liquidator,'only liquidator');
        _mint(to,amount);
    }
    
}