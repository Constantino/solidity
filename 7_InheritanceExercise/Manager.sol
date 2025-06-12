// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract Manager {
    uint[] public employeeIds;

    function addReport(uint _number) public {
        employeeIds.push(_number);
    }

    function resetReports() public {
        employeeIds = new uint[](0);
    }
}
