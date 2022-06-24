//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

library Human {
    struct Person {
        uint age;
    }

    function birthDay(Person storage _person) public {
        _person.age++;
    }

    function getAge(Person storage _person) public view returns(uint){
        return _person.age;
    }
}

contract HumanContract {
    mapping(uint => Human.Person) people;

    function newYear() public {
        Human.birthDay(people[0]);
    }

    function getAge() public view returns(uint) {
        return Human.getAge(people[0]);
    }
}