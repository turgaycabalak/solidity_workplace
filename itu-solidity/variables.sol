
//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Variables {
    /*
    NOT:
    1 wei = 1
    1 ether = 10^18 wei
    1 gwei = 10^9 wei

    NOT-2 (zaman birimleri):
    1 = 1 seconds
    1 minutes = 60 seconds
    1 hour = 60 minutes = 3600 seconds
    1 days
    1 weeks ....
    */


    //////// Fixed-size types  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    bool isActive = true;//default olarak false
    bool isTrue = false;

    int number1 = 12;//default olarak int256 olur.  -2^256 to 2^256
    int8 number2 = 12;// -2^8 to 2^8
    uint number3 = 12;// 0 to 2^256

    //ethereum (cüzdan) adreslerini tutmak icin kullanilir
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //20 byte uzunlugundadir ve sabittir

    // bytes1 to bytes32
    bytes32 name1 = "ngss"; //stringe benzer bir yapidir. boyutunu (32 gibi) vermezsek dinamik olur


    ///////// Dynamic-size types  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    string name2 = "ngss";
    bytes name3 = "ngss dynamic";

    uint[] array1 = [1, 2, 3, 4, 5];//index 0, 1, 2 ... array1[0] gibi. boyut belirtilmezse dinamik olur. veri ekle, cikart islemleri yapilir.

    mapping(uint => string) myMap1;
    myMap1[3] = "ngss";//eleman ekleme (key => value)

    
    ////// Use defined value types    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    struct Person {
        uint ID;
        string name;
        uint age;
        address yourAddress;
    }

    Person person1;
    person1.ID = 123456123456;
    person1.name = "trgy";
    person1.age = 30;
    person1.yourAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


    enum trafficLight { // index 0, 1, 2, ...
        RED,
        YELLOW,
        GREEN
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //if condition - same as java or etc.

    string public company = "ngss";//state variable (contract in hemen altina yazilan ve heryerinden ulasilan)

    function show() public view returns (string memory){
        return company;
    }

    function show2() public pure returns (uint){// hata verir !!!!!
        uint localNumber = 56; //local variable
        return localNumber;
    }

    function show3() public view returns (uint){
        //global variables
        block.difficulty;//su anki blok'un zorlugu ile alakali degiskeni verir
        block.gaslimit;// su anki blok'un gaz limitini verir
        block.timestamp;//su anki zamani saniye cinsinden verir

        msg.sender;// blok uzerinde degisiklik yapan ya da okuma yapan kisilerin cuzdan adresini(address tipinde return eder) verir(gonderiyi kim yaptiysa)
        msg.value;// bir contract a ether gondeririz. gonderilen miktari verir.
        msg.data;// contract a mesaj gondeririz. gonderilen mesaji verir
        
        return block.number;// kacinci blokta oldugumuzu verir
    }
    
}