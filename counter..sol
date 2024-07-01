// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract counter{
    uint count; // state variiable with uint data type 
    constructor(){//constructor gives initial value for this count value
        count=0;
    }

    function getcount()public view returns (uint) { // function for get the value of count visiblity public free of charge in blockchain 
        return count;
    }

    function countincrement()public{ // increment function 
        count=count+1;
    }
}