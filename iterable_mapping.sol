//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract iterablemapping {
    address[] public addressArray;
    mapping(address => bool) public whitelist;
    uint256 private count = 0;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function addAddress(address addr)
        public
        onlyOwner
        returns (string memory value)
    {
        if (whitelist[addr] == true) {
            return "Error! Already whitelisted";
        } else {
            whitelist[addr] = true;
            addressArray.push(addr);
            count++;
            return "Successfully Whitelisted";
        }
    }

    function getCount() public view returns (uint256) {
        return count;
    }

    function isWhitelisted(address addr) public view returns (bool) {
        if (whitelist[addr] == true) {
            return true;
        }
        return false;
    }
}
