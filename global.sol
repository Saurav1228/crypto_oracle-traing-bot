//There are special variables and functions which always exist in the global namespace 
//and are mainly used to provide information about the blockchain or are general-use utility functions

pragma solidity 0.8.13;

contract global {
    uint public a = block.chainid;
    uint public b = block.gaslimit;
    uint public c = block.timestamp;
    address public d = block.coinbase;
    uint public e = block.number;
    uint public f = block.difficulty;
    uint public g = msg.value;

}