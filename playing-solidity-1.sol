pragma solidity ^0.8.13;

contract random {
    function addition(uint x, uint y) public pure returns (uint) {
        return (x + y);
    }

    function add() public pure returns (uint) {
        //Passing function parameters explicity like key value
        return addition({x: 1, y: 3});
    }
}
