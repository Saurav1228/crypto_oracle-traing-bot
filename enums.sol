// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract enumcontract {
    enum Status {
        pending,
        cancelled,
        waiting,
        accepted
    }

    Status public statusenum;

    function get() public view returns (Status) {
        return statusenum;
    }

    function set(Status _status) public {
        statusenum = _status;
    }
}
