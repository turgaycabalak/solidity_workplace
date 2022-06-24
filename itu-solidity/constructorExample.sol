//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Constructor {
    // contract olusturulurken msg.sender dan gelen cuzdan numarasini
    //address tipindeki owner degiskenine assign eder.
    
    address public immutable owner;
    uint public constant number = 10;

    constructor(){
        // transaction gonderen kisi
        owner = msg.sender;//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    }
    
}



