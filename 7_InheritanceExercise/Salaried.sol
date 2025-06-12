// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "./Employee.sol";

contract Salaried is Employee {
    uint public annualSalary;

    constructor(
        uint _annualSalary,
        uint _idNum,
        uint _managerID
    ) Employee(_idNum, _managerID) {
        idNumber = _idNum;
        managerId = _managerID;
        annualSalary = _annualSalary;
    }

    function getAnnualCost() public view override returns (uint) {
        return annualSalary;
    }
}
