//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract SimpleStorage {
    uint256 favoriteNumber;
    // People public person = People({favoriteNumber: 2, name: "ngss"});
    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;//transaction cost	43724 gas, gas	50283 gas
        retrieveView();                                   //43864 gas
    }

    function retrieveView() public view returns(uint256) {
        return favoriteNumber;//23523 gas
    }

    function retrievePure() public pure returns(uint256) {
        return 8;//21445 gas
    }

    function addPerson(string memory _name, uint256 _number) public {
        people.push(People(_number, _name));
        nameToFavoriteNumber[_name] = _number;
    }

}