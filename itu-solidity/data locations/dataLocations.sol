//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

/*
        Kontrat             <----     Kontrata yapilan cagri
        -------                         -----------------
    Kontrat depolama alani          Fonksiyon icin ayrilan hafiza ve cagridaki data alani

    memory:     Gecici hafiza
    sotrage:    Kalici hafiza
    calldata:   Cagridaki argumanlar

    bytes, string, array, struct

    * Deger tipleri (uing, int, bool, bytes32) kontrat uzerinde storage,
      fonksiyon icinde memory'dir.
    
    * mapping'ler her zaman kontrat uzerinde tanimlanir ve storage'dadir.

*/

contract DataLoc {

    uint256 myVal; //storage
    mapping(address => uint256) balances; // storage

    string myName = "ngss"; //storage

    function myFn(uint256 paramUInt/*memory*/) external {}

    //calldata: degistirilemez (read-only)
    //memory: degistirilebilir
    function myFn2(string memory paramString) external pure {
        paramString = "";
    }

}