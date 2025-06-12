// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "./Employee.sol";

contract Hourly is Employee {
    uint public hourlyRate;

    constructor(
        uint _hourlyRate,
        uint _idNumber,
        uint _managerId
    ) Employee(_idNumber, _managerId) {
        hourlyRate = _hourlyRate;
        idNumber = _idNumber;
        managerId = _managerId;
    }

    function getAnnualCost() public view override returns (uint) {
        return hourlyRate * 2080;
    }
}
