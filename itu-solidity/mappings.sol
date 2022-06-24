//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Mapping {
    mapping(address => bool) public registered;
    mapping(address => uint256) public favNums;


    function register(uint256 _favNum) public {

        //kosul true degilse fonksiyonu revert eder ve cagirilmasini engeller
        require(!registered[msg.sender], "Kullanici daha once kayit yapti.");
        

        registered[msg.sender] = true;
        favNums[msg.sender] = _favNum;
    }

    function isRegistered() public view returns(bool) {
        return registered[msg.sender];
    }

    function deleteRegistered() public {
        require(!isRegistered(), "Kullanici daha once kayit yapti.");
        
        delete(registered[msg.sender]);
        delete(favNums[msg.sender]);
    }
}

contract NestedMapping {
    mapping(address => mapping(address => uint256)) public debts;

    function incDebt(address _borrower, uint256 _amount) public {
        debts[msg.sender][_borrower] += _amount;
    }

    function decDebt(address _borrower, uint256 _amount) public {
        require(debts[msg.sender][_borrower] <= _amount, "Not enough debt.");
        debts[msg.sender][_borrower] -= _amount;
    }

    function getDebt(address _borrower) public view returns(uint256) {
        return debts[msg.sender][_borrower];
    }
}