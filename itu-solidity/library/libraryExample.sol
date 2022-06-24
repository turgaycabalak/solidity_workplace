//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.15;

library Math {

    function plus(uint x, uint y) public pure returns(uint) {
        return x + y;
    }

    function minus(uint x, uint y) public pure returns(uint) {
        require(x >= y, "x should equal or greater than y.");
        return x - y;
    }

    function multi(uint x, uint y) public pure returns(uint) {
        return x * y;
    }

    function divide(uint x, uint y) public pure returns(uint) {
        require(y != 0, "y cannot be 0.");
        return x / y;
    }

    function min(uint x, uint y) public pure returns(uint) {
        if(x <= y){
            return x;
        } else {
            return y;
        }
    }

    function max(uint x, uint y) public pure returns(uint) {
        if(x >= y){
            return x;
        } else {
            return y;
        }
    }
}

library Search {
    function indexOf(uint[] memory list, uint data) public pure returns(uint) {
        for(uint i = 0; i < list.length; i++){
            if(list[i] == data){
                return i;
            }
        }
        return list.length;
    }
}

contract Library {

    using Math for uint;
    using Search for uint[];

    function trial0(uint[] memory arr, uint number) public pure returns(uint) {
        //return Search.indexOf(arr, number);
        return arr.indexOf(number);
    }

    function trial1(uint x, uint y) public pure returns(uint) {
        //return Math.plus(x, y);
        return x.plus(y);
    }

    function trial2(uint x, uint y) public pure returns(uint) {
        return Math.minus(x, y);
    }

    function trial3(uint x, uint y) public pure returns(uint) {
        return Math.multi(x, y);
    }

    function trial4(uint x, uint y) public pure returns(uint) {
        return Math.divide(x, y);
    }

    function trial5(uint x, uint y) public pure returns(uint) {
        return Math.min(x, y);
    }

    function trial6(uint x, uint y) public pure returns(uint) {
        return Math.max(x, y);
    }
}