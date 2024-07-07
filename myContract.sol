// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ownable{
    address owner;
    modifier onlyOwner() {
        require(msg.sender==owner,"Must be owner");
        _;
    }
    constructor() public{
        owner=msg.sender;
}
}

contract SecretVault{
    string secret;
      constructor(string memory _secret) public{
        secret=_secret;
}
function getsecret() public view  returns (string memory){
        return secret;
    }
}

contract myContract is ownable {
   
    address secretVault;

    
    constructor(string memory _secret) public{
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault=address(_secretVault);
        super;
        
    }
    function getsecret() public view  returns (string memory){
        return SecretVault(secretVault).getsecret();
    }
}