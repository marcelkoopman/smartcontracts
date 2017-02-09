pragma solidity ^0.4.9;


contract SecureData {
    
    uint data;
    address creator;
    
    function SecureData() {
        creator = msg.sender;
    }
    
    function setData(uint value) { 
        verifyMsgSender();
        data = value;
    } 
    
    function getData() constant returns (uint) { 
        verifyMsgSender();
        return data; 
    }
    
    function verifyMsgSender() private {
        if (msg.sender != creator) 
          throw;
    }
}

