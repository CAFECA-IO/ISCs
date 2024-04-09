// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

interface ISC21 {
  event Minted(address indexed operator, address indexed to, uint amount, bytes data, bytes operatorData);
  event Burned(address indexed operator, address indexed from, uint amount, bytes data, bytes operatorData);

  function isc() external view returns (uint16);
  function isDebitable() external view returns (bool);
  function name() external view returns (string memory);
  function symbol() external view returns (string memory);
  function decimals() external view returns (uint8);
  function totalSupply() external view returns (uint);
  function balanceOf(address owner) external view returns (uint);
  function allowance(address owner, address spender) external view returns (uint);

  function debit(address to, uint amount, address voucher, bytes calldata data) external returns (bool);
  function credit(address to, uint amount, address voucher, bytes calldata data) external returns (bool);
}