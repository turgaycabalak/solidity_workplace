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

struct Student {
    uint8 age;
    uint16 score;
    string name;
}

contract School {
    uint256 totalStudents = 0;//storage
    mapping(uint256 => Student) students;//storage
    
    function addStudent(string calldata name, uint8 age, uint16 score) external {
        uint256 currentId = totalStudents++;

        students[currentId] = Student(age, score, name);
    }

    function changeStudentInfoStorage(uint256 id, string calldata newName, uint8 newAge, uint16 newScore) external {
        Student storage currentStudent = students[id];
        
        currentStudent.name = newName;
        currentStudent.age = newAge;
        currentStudent.score = newScore;
    }

    function changeStudentInfoMemory(uint256 id, string calldata newName, uint8 newAge, uint16 newScore) external {
        Student memory currentStudent = students[id];
        
        currentStudent.name = newName;
        currentStudent.age = newAge;
        currentStudent.score = newScore;
    }

    function getStudentName(uint256 id) external view returns(string memory) {
        return students[id].name;
    }

}