// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ERC20 {
  string public name;
  string public symbol;
  uint8 public decimals = 18;
  uint public totalSupply = 0;
  mapping(address => uint) public balanceOf;
  mapping(address => mapping(address => uint)) public allowance;

  constructor(string memory _name, string memory _symbol, uint8 _decimals, uint _totalSupply) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = _totalSupply;
  }

  event Approval(address indexed owner, address indexed spender, uint value);
  event Transfer(address indexed from, address indexed to, uint value);

  function approve(address spender, uint value) external returns (bool) {
    // TODO: safe math
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }

  function transfer(address to, uint value) external returns (bool) {
    require(balanceOf[msg.sender] >= value, "ERC20: transfer amount exceeds balance");
    // TODO: safe math
    balanceOf[msg.sender] -= value;
    balanceOf[to] += value;
    emit Transfer(msg.sender, to, value);
    return true;
  }

  function transferFrom(address from, address to, uint value) external returns (bool) {
    require(allowance[from][msg.sender] >= value, "ERC20: transfer amount exceeds allowance");
    // TODO: safe math
    allowance[from][msg.sender] -= value;
    balanceOf[from] -= value;
    balanceOf[to] += value;
    emit Transfer(from, to, value);
    return true;
  }
}