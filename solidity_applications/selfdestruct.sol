//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.13;

contract destruct {
    address public owner;
    // bytes public bytes69 = abi.encode(69);
    uint value = 40;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive () external payable {
    }

    function inc(uint x) external {
        value += x;
        selfdestruct(payable(msg.sender));
    }

}

contract kill {

    address public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function callDestruct(destruct _destruct, uint x) external {
        _destruct.inc(x);
    }

    function slefDestructThis() external {
        require(msg.sender == owner, "Unauthoried");
        selfdestruct(payable(msg.sender));
    }  

}