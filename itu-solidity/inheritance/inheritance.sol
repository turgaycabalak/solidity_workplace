//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

// virtual -> override edilebilir olarak tanimlama

contract A {
    uint public x;
    uint public y;

    function setX(uint _x) virtual external {
        x = _x;
    }

    function setY(uint _y) external {
        y = _y;
    }


}

// override -> override edilen fonksiyonal yazilmasi gerekiyor

contract B is A {
    uint public z;

    function setZ(uint _z) external {
        z= _z;
    }

    function setX(uint _x) override external {
        x = _x + 2;
    }
}

contract Human {
    function sayHello() public pure virtual returns(string memory) {
        return "Welcome to NGSS.";
    }
}

contract SuperHuman is Human {
    function sayHello() public pure override returns(string memory) {
        return "Selamlar NGSS'e hosgeldiniz.";
    }

    function welcomeMsg(bool isMember) external pure returns(string memory) {
        //return isMember ? sayHello() : Human.sayHello();
        return isMember ? sayHello() : super.sayHello();
    }
}