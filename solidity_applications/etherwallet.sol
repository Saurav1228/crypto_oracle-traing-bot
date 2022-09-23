// SPDX-License-Identifier: MIT
// Ethereum Wallet

pragma solidity ^0.8.13;

contract etherwallet {
    event Deposit(address sender, uint256 amount, uint256 Timestamp);
    event Withdraw(uint256 amount, uint256 Timestamp);

    address payable public owner;

    constructor() public {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    // Recieve Function
    receive() external payable {
        emit Deposit(msg.sender, msg.value, block.timestamp);
    }

    function withdraw(uint256 _amount) public onlyOwner {
        require(
            _amount <= address(this).balance && _amount != 0,
            "Invalid amount"
        );
        owner.transfer(_amount);
        emit Withdraw(_amount, block.timestamp);
    }

    //Getter function for balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
