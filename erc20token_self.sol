//SPDX-License-Identifier: UNLICENSED

//Zero address

pragma solidity 0.8.13;

contract erc20token {
    string public name;
    address public deployer;
    uint256 public decimals = 9;
    string public symbol;
    uint256 public TotalSupply;

    mapping(address => uint) private balances;
    mapping(address => bool) private blacklistmap;

    constructor(
        string memory _name,
        string memory _symbol,
        uint _initialsupply
    ) {
        name = _name;
        symbol = _symbol;
        deployer = msg.sender;
        TotalSupply = _initialsupply;
    }

    //modifier
    modifier onlyOwner() {
        require(msg.sender == deployer, "Not the Owner");
        _;
    }

    //function airdrop to an array of addresses
    function airdrop(address[] memory _addrs, uint _amount) public {
        require(
            (_amount * (_addrs.length - 1)) <= balances[msg.sender],
            "Insufficient Balance for an Airdrop"
        );
        for (uint i = 0; i < _addrs.length; i++) {
            balances[_addrs[i]] += _amount;
            balances[msg.sender] -= _amount;
        }
    }

    function transfer(address _to, uint _amount) public returns (bool) {
        require(_amount <= balances[msg.sender], "Insufficient Balance");
        require(blacklistmap[msg.sender] == false, "Address Blacklisted");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        return (true);
    }

    function mint(uint _amount) public onlyOwner {
        balances[msg.sender] += _amount;
        TotalSupply += _amount;
    }

    function burn(uint _amount) public {
        require(_amount <= balances[msg.sender], "Insufficient Balance");
        balances[msg.sender] -= _amount;
        TotalSupply -= _amount;
    }

    function blacklist(address _addr, bool _value) public onlyOwner {
        require(blacklistmap[_addr] == false, "Already Blacklisted");
        blacklistmap[_addr] = _value;
    }

    function getBalance(address _addr) public view returns (uint) {
        return balances[_addr];
    }
}
