//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {

    function store(uint256 _favoriteNumber) override public {
        favoriteNumber = _favoriteNumber + 5;
    }

}