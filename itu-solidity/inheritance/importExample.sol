//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;


//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Wallet is Ownable {
    fallback() payable external {}

    function sendEther(address payable to, uint amount) onlyOwner public {
        to.transfer(amount);
    }

    function showBalance() public view returns(uint) {
        return address(this).balance;
    }
}//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4