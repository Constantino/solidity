// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "./Salaried.sol";
import "./Manager.sol";

contract EngineeringManager is Salaried, Manager {
    constructor(
        uint _annualSalary,
        uint _idNum,
        uint _managerID
    ) Salaried(_annualSalary, _idNum, _managerID) {
        idNumber = _idNum;
        managerId = _managerID;
        annualSalary = _annualSalary;
    }
}
