//SPDX-License-Identifier: IIIT SONEPAT
pragma solidity 0.8.13;

contract ethervault {
    address public owner;
    uint256 public balance_contract;
    uint256 public oneether = 1 ether;

    event Deposit(address, uint256);
    event Withdraw(address, uint256);

    mapping(address => uint256) private balanceMap;
    mapping(address => bool) private blacklistMap;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    modifier Isblacklisted() {
        require(blacklistMap[msg.sender] == false);
        _;
    }

    function blacklist(address _addr, bool _value) public onlyOwner {
        blacklistMap[_addr] = _value;
    }

    function deposit() public payable {
        require(
            msg.value > 0 && msg.value <= address(msg.sender).balance,
            "Error! Invalid"
        );
        balanceMap[msg.sender] += msg.value;
        balance_contract += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(address payable _to, uint256 _amount)
        public
        Isblacklisted
    {
        require(
            _amount <= balanceMap[msg.sender] && _amount > 0,
            "Invalid Balance"
        );

        //Balance Updated First, then Transfer is done to prevent re-entrancy
        balanceMap[msg.sender] -= _amount;
        balance_contract -= _amount;
        _to.transfer(_amount);

        emit Withdraw(_to, _amount);
    }

    function getBalance_contract() public view returns (uint256) {
        return balance_contract;
    }

    function getBalance_Address() public view returns (uint256) {
        return balanceMap[msg.sender];
    }
}
