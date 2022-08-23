// SPDX-License-Identifier: MIT

//Solidity Array Operations
pragma solidity ^0.8.13;

contract arraycontract {

    uint[] public arr1;
    uint[] public arr2 = [1,2,3,4,5,6,7,8];

    function arr2operation(uint index) public returns (uint)  {
        arr2[arr2.length - 1] = index;
        arr2.push(87);
        arr2.push(69);
        return arr2[arr2.length-1];
    }

    function getArray() public view returns (uint[] memory) {
        return arr2;
    }
    
    function getArrayLength() public view returns (uint) {
        return arr2.length;
    }

}