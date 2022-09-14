// SPDX-License-Identifier: MIT
// Zero address
// 0x0000000000000000000000000000000000000000

pragma solidity ^0.8.13;

contract array_contract {
    //Dynamic Array
    uint256[] public dynamicArray;
    uint256 owner_count = 0;

    //events
    event changeOwnerEvent(
        address indexed new_owner,
        string message,
        uint256 owner_count
    );

    //owner address
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //function modifier 'onlyOwner'
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    function push(uint256 x) public onlyOwner {
        dynamicArray.push(x);
    }

    function pop() public onlyOwner {
        dynamicArray.pop();
    }

    function get(uint256 _index) public view returns (uint256) {
        return (dynamicArray[_index]);
    }

    function updateAtIndex(uint256 _index, uint256 _value) public onlyOwner {
        require(_index < dynamicArray.length, "Invalid Index");

        dynamicArray[_index] = _value;
    }

    function deleteAtIndex(uint256 _index) public onlyOwner {
        delete dynamicArray[_index];
    }

    function arrayLength() public view returns (uint256) {
        return dynamicArray.length;
    }

    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
        owner_count += 1;
        emit changeOwnerEvent(
            msg.sender,
            "New Owner of the Contract",
            owner_count
        );
    }
}
