//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract iterablemapping {
    address[] public addressArray;
    mapping(address => bool) public whitelist;
    uint private count = 0;

    function addAddress(address addr) external view returns (string memory) {
        if(whitelist[addr] == true) {
            return "ALready whitelisted";
        }
    }

    function getCount() public view returns (uint){
        return count;
    }


}