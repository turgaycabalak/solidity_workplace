//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

/*
Get funds from users
Withdraw funds
Set a minimum funding value in USD
*/

import "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint public minimumUsd = 50 *1e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;


    function fund() public payable {
        
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough eth."); //1e18 = 1eth
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    

    //function withdraw(){}


}