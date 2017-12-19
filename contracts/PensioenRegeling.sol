pragma solidity ^0.4.18;

contract PensioenRegeling {

  address admin;

  function valideerOpbouw(uint opbouw) pure public {
      require(opbouw > 0);
      require(opbouw < 100);
  }
}
