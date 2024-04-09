// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract ERC20 {
  event Approval(address indexed owner, address indexed spender, uint value);
  event Transfer(address indexed from, address indexed to, uint value);

  string public name;
  string public symbol;
  uint8 public decimals;
  uint public totalSupply;
  mapping(address => uint) public balanceOf;
  mapping(address => mapping(address => uint)) public allowance;

  constructor(string memory _name, string memory _symbol, uint8 _decimals, uint _totalSupply) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _totalSupply;
    balanceOf[msg.sender] = _totalSupply;
  }

  function approve(address spender, uint value) external returns (bool) {
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
  function transfer(address to, uint value) external returns (bool) {
    // TODO: safe math
    require(balanceOf[msg.sender] >= value, "ERC20: transfer amount exceeds balance");
    balanceOf[msg.sender] -= value;
    balanceOf[to] += value;
    emit Transfer(msg.sender, to, value);
    return true;
  }
  function transferFrom(address from, address to, uint value) external returns (bool) {
    // TODO: safe math
    require(allowance[from][msg.sender] >= value, "ERC20: transfer amount exceeds allowance");
    require(balanceOf[from] >= value, "ERC20: transfer amount exceeds balance");
    allowance[from][msg.sender] -= value;
    balanceOf[from] -= value;
    balanceOf[to] += value;
    emit Transfer(from, to, value);
    return true;
  }
}