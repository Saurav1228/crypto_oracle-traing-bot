//SPDX-License-Identifier: UNLICENSED

// Time Lock Smart contract - 1 month
// With function to increase lock time

pragma solidity ^0.8.13;

contract TimeLock {
    address payable public deployer;

    mapping(address => uint256) public balances;
    mapping(address => uint256) public lockTime;

    constructor() {
        deployer = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == deployer, "Not the owner");
        _;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        lockTime[msg.sender] = block.timestamp + 4 weeks;
    }

    //function to increase time lock
    function increaseLockTime(uint256 _secondsToIncrease) public onlyOwner {
        lockTime[msg.sender] += _secondsToIncrease;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0, "Insufficient funds");
        require(
            block.timestamp > lockTime[msg.sender],
            "Lock time not expired"
        );

        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}
