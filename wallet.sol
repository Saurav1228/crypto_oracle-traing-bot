// SPDX-License-Identifier: MIT

//Wallet Contract
pragma solidity ^0.8.13;

contract wallet {
    //events
    event Deposit(address sender, uint256 amount, uint256 balance);
    event Withdraw(uint256 amount, uint256 balance);
    event Transfer(address to, uint256 amount, uint256 balance);

    address payable public owner;

    constructor() public payable {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not Owner");
        _;
    }

    function deposit() public payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function withdraw(uint256 _amount) public onlyOwner {
        owner.transfer(_amount);
        emit Withdraw(_amount, address(this).balance);
    }

    function transfer(address payable _to, uint256 _amount) public onlyOwner {
        _to.transfer(_amount);
        emit Transfer(_to, _amount, address(this).balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
