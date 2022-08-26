// SPDX-License-Identifier: MIT

//Fallback Solidity
pragma solidity ^0.8.13;

contract RecieveEther {
    event Log(uint256 gas);

    fallback() external payable {
        emit Log(gasleft());
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, ) = _to.call{gas: 1000, value: msg.value}("");
        require(sent, "Failed to Send Ether");
    }
}
