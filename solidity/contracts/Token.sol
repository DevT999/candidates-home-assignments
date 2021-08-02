pragma solidity ^0.8.1;

contract Token {

    string public name = "Hardhat Token";
    string public symbol = "BT";

    uint256 public totalSupply = 1000000;

    uint public balanceReceived;

    address public owner;

    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns(uint) {
        return balances[address(this)];
    }

    function withdrawMoneyTo(address payable _to, uint256 amount) public {
        transfer(_to, amount);
    }
}