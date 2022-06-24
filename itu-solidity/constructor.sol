//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Constructor {
    //constant, immutable
    //constant -> compile time
    //immutable -> runtime
    
    uint public constant pi = 314;
    uint public immutable specialNumber;

    string public tokenName;
    uint public totalSupply;

    constructor(string memory name, uint number){
        specialNumber = 123456;
        tokenName = name;
        totalSupply = number;
    }

}