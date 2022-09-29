//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract maincontract {
    uint public x;
    uint public count;
    address payable public addr;

    function increase_x(uint _x) public {
        x = _x;
    }

    function delegatecall(address _addr, uint _x) public {
        (bool success, ) = _addr.delegatecall(
            abi.encodeWithSignature("increasex(uint256)", _x)
        );
        require(success, "Failed call");
    }
}

contract delegatecontract {
    uint public x;
    uint public count;
    address payable public addr;

    function increasex(uint _x) public {
        x = _x;
    }
}
