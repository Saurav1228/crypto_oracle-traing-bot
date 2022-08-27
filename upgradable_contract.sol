// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Delegate Call B from A
contract B {
    // Storage layout must be the same as contract A
    uint256 public num;
    address public sender = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    uint256 public value;

    function setVars(uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract B2 {
    // Version 2 for Contract B
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(uint256 _num) public payable {
        num = 10 * _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint256 _num) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
