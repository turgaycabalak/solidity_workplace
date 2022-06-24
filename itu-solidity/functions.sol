//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Functions {

    uint private luckyNumber = 7;

    //public, private, internal, external
    function getNumber() public view returns(uint) {
        return luckyNumber;
    }

    function setNumber(uint newNumber) public {
        luckyNumber = newNumber;
    }

    //stateden degil, fonk. icinden urettigimiz bir degeri dondurmek icin pure kullanilir.
    //birden fazla degeri return edebiliriz.
    function myPureFuncWithoutReturnName() public pure returns(uint, bool, bool) {
        return (5, true, false);
    }

    //birden fazla return eden objelerin isimlerini veririz., return yazmaya gerek kalmaz.
    function myPureFuncWithReturnName() public pure returns(string memory name, uint age, bool isActive) {
        name = "ngss";
        age = 9;
        isActive = true;
    }

    //global state'deki herhangi bir degeri okuyacaksak(sadece read islemi) fonksiyona view modifier ekleriz
    function giveMeTime() public view returns(uint) {
        return block.timestamp;
    }

    //global veya state variable'dan herhangi bir deger okuma/yazma yapilmiyorsa,
    //sadece fonksiyon icinden bir deger donduruluyorsa pure yapilir.
    function calculate(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    //private gibi disardan cagirilamazlar. ama miras alan cotract'lar cagirabilir.
    function internalFunction() internal pure returns(string memory) {
        return "i am an internal function";
    }

    //disardan cagirilabilir. icerden cagirilamaz veya miras alinamaz.
    function externalFunction() external pure returns(string memory) {
        return "i am an external function";
    }
    

}