//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // simpleStorage = new SimpleStorage();
        simpleStorageArray.push(new SimpleStorage());
    }

    function sfStore(uint256 _simpleStrgIndex, uint256 _favoriteNumber) public {
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStrgIndex];
        // simpleStorage.store(_favoriteNumber);

        simpleStorageArray[_simpleStrgIndex].store(_favoriteNumber);
    }

    function sfGet(uint256 _simpleStrgIndex) public view returns(uint256) {
        return simpleStorageArray[_simpleStrgIndex].retrieveView();
    }
    
}