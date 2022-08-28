// SPDX-License-Identifier: MIT
// Ethereum Wallet 

pragma solidity ^0.8.13;

contract etherwallet {
    event Deposit(address sender, uint amount, uint Timestamp);
    event Withdraw(uint amount, uint Timestamp);

    address payable public owner;

    constructor() public {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    // Recieve Function
    receive () external payable {
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }

    function withdraw(uint _amount) public onlyOwner {
        require(_amount <= address(this).balance && _amount != 0, "Invalid amount");
        owner.transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}