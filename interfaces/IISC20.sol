// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

interface ISC20 {
  event Approval(address indexed owner, address indexed spender, uint value);
  event Transfer(address indexed from, address indexed to, uint value);
  event Minted(address indexed operator, address indexed to, uint amount, bytes data, bytes operatorData);
  event Burned(address indexed operator, address indexed from, uint amount, bytes data, bytes operatorData);

  function isc() external view returns (uint16);
  function name() external view returns (string memory);
  function symbol() external view returns (string memory);
  function decimals() external view returns (uint8);
  function totalSupply() external view returns (uint);
  function balanceOf(address owner) external view returns (uint);
  function allowance(address owner, address spender) external view returns (uint);

  function approve(address spender, uint value) external returns (bool);
  function transfer(address to, uint value, bytes calldata data) external returns (bool);
  function transferFrom(address from, address to, uint value) external returns (bool);
  function mint(address to, uint amount, bytes calldata data) external returns (bool);
  function burn(uint amount, bytes calldata data) external returns (bool);
  function burnFrom(address from, address to, uint value) external returns (bool);
}