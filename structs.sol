// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract structcontract {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo({text: _text, completed: false}));

        Todo memory todo;
        todo.text = _text;
        todo.completed = true;
    }

    function todoslen() public view returns (uint256) {
        return todos.length;
    }
}
