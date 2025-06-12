// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

abstract contract Employee {
    uint public idNumber;
    uint public managerId;

    constructor(uint _idNum, uint _managerId) {
        idNumber = _idNum;
        managerId = _managerId;
    }

    function getAnnualCost() public virtual returns (uint);
}
