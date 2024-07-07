// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{

    enum Statuses{Vacant,occupied}// keep the states 
    Statuses public currentStatus;

    event Occupy(address _occupant , uint _value); // Store the info 

    address payable public  owner; 

    constructor(){
        owner=payable (msg.sender);
        currentStatus=Statuses.Vacant;
    }
    modifier OnlyWhileVacant{
        require(currentStatus==Statuses.Vacant,"Currently Occupaide."); //we can use modifier in function  call in this senario our book function work if satisfied the OnlyWhileVacant modifier;
        _;
    }

    modifier Cost(uint _amount){
        require(msg.value>=_amount,"Not Enough Eter Provided"); // function will run when satisfied 2 req arguments was applied
        _; //New Line
    }


    function book() public payable OnlyWhileVacant Cost(2 ether) {
    currentStatus=Statuses.occupied; // Doubble sell have to privent 

    (bool sent, bytes memory data)=owner.call{value:msg.value}("");
    require(true);
    emit Occupy(msg.sender, msg.value); // who called the function an wich ammount
    }
}

