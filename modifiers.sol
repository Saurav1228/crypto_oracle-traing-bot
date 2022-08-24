// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

 contract structcontract {
     address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

     modifier onlyOwner() {
         require(msg.sender == owner, "Not the Owner");
         _;
     }

    modifier validAddress(address _newOwner) {
         require(_newOwner != address(0), "Invalid Address");
         _;
     }


     function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
         owner = _newOwner;
     }
 }