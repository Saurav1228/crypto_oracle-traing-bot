//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract A {
    function random() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    function random() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is B {
    function random() public pure virtual override returns (string memory) {
        return "C";
    }
}

contract D is B, C {
    function random() public pure override(C, B) returns (string memory) {
        B.random();
        super();
    }
}
