// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Callee {
    uint public x;
    uint public value;

    //function setX
    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

//caller contract
contract Caller {
    function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(address payable _callee, uint _x) public payable {
        Callee callee = Callee(_callee);
        (uint x, uint value) = callee.setXandSendEther{value: msg.value}(_x);
    }
}
