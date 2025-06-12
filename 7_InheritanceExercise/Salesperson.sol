// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "./Hourly.sol";

contract Salesperson is Hourly {
    constructor(
        uint _hourlyRate,
        uint _idNumber,
        uint _managerId
    ) Hourly(_hourlyRate, _idNumber, _managerId) {}
}
