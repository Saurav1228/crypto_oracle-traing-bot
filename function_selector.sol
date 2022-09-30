//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.13;

contract callee {
    uint[] public arr;
    function setVars(uint _value) public {
        arr.push(_value);
    }
}

contract caller {
    uint[] public arr;
    function set(address _contract, uint _value) public {
        (bool success,) = _contract.delegatecall(abi.encodeWithSelector((callee.setVars.selector), _value));
    }
}

