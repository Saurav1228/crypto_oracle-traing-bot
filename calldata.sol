pragma solidity 0.5.11;

//calldata vs memory in solidity
contract Test {
    string stringTest;

    function memoryTest(string memory _exampleString)
        public
        returns (string memory)
    {
        _exampleString = "example"; // You can modify memory
        string memory newString = _exampleString; // You can use memory within a function's logic
        return newString; // You can return memory
    }

    function calldataTest(string calldata _exampleString)
        external
        returns (string memory)
    {
        // cannot modify _exampleString or use in any function's logic
        // and cannot use in function logic but can return it
        return _exampleString;
    }
}
