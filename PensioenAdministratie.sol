pragma solidity ^0.4.18;

import "contracts/PensioenRegeling.sol";

contract PensioenAdministratie {

   address admin; // adres van eigenaar contract
   address pensioenRegeling; // adres van deployed contract

   mapping (address => bytes32) deelnemers;
   mapping (address => uint) balance;

   function addDeelnemer(address deelnemer, bytes32 json) public {
       require(msg.sender == admin);
       deelnemers[deelnemer] = json;
   }

   function getDeelnemer(address deelnemer) public view returns (bytes32) {
      return deelnemers[deelnemer];
   }

   function opbouw(address deelnemer, uint value) public returns (uint) {
       require(msg.sender == admin);
       PensioenRegeling regeling = PensioenRegeling(pensioenRegeling);
       regeling.valideerOpbouw(value);
       balance[deelnemer] += value;
       return getOpbouw(deelnemer);
   }

   function getOpbouw(address deelnemer) public view returns (uint) {
       return balance[deelnemer];
   }
}
