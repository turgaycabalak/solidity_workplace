//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

contract Bank {

    mapping(address => uint) balances;


    //bir fonksiyona ether gonderilmek istenirse, fonksiyona payable yazilir. 
    function sendEtherToContract() payable external {
        balances[msg.sender] = msg.value;//disardan value almak icin function payable olmali
    }

    function showBalance() external view returns(uint){
        return balances[msg.sender];
    }

    ////// transfer()
    //contract'tan bir adrese ether gondermek istenirse, payable(msg.sender) ile gonderilir
    //veya payable parametre olarak alinir.(ornek: address payable to)
    function withdrawWithTransfer(address payable to, uint amount) external {
        // payable(msg.sender).transfer(balances[msg.sender]);

        // require(balances[msg.sender] >= amount, "Not enough ether.");

        // transfer kullanirken eger yeterli bakiye bulmazsa, transfer kendisi otomatik revert yapabiliyor
        // boylece yukardaki require ile kontrole gerek kalmiyor
        to.transfer(amount);

        balances[msg.sender] -= amount;
    }

    ////// send()
    // eger fonk gerceklesirse true, aksi halde false doner
    function withdrawWithSend(address payable to, uint amount) external returns(bool) {
        bool result = to.send(amount);
        balances[msg.sender] -= amount;

        return result;
    }

    ////// call()
    function withdrawWithCall(address payable to, uint amount) external returns(bool) {
        (bool sent,) = to.call{value: amount}("");
        balances[msg.sender] -= amount;

        return sent;
    }


    uint public receiveCount = 0;
    uint public fallbackCount = 0;

    //contract'a ether gondermek icin (data olmadan)
    receive() external payable {
        receiveCount++;
    }

    //data gonderdigimiz durumlarda
    fallback() external payable {
        fallbackCount++;
    }

}