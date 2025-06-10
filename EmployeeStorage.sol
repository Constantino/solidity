// SPDX-License-Identifier: Unlicensed

pragma solidity 0.8.17;

contract EmployeeStorage {
    error TooManyShares(uint256);

    string public name;
    uint40 public idNumber;
    uint16 private shares;
    uint16 private salary;

    constructor(
        uint16 _shares,
        string memory _name,
        uint16 _salary,
        uint40 _idNumber
    ) {
        shares = _shares;
        name = _name;
        salary = _salary;
        idNumber = _idNumber;
    }

    function viewSalary() public view returns (uint16) {
        return salary;
    }

    function viewShares() public view returns (uint16) {
        return shares;
    }

    function grantShares(uint16 _shares) public {
        if (_shares > 5000) {
            revert("Too many shares");
        }

        uint16 _newShares = shares + _shares;
        if (_newShares > 5000) {
            revert TooManyShares(_newShares);
        }
        shares = _newShares;
    }

    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload(_slot)
        }
    }

    function debugResetShares() public {
        shares = 1000;
    }
}
