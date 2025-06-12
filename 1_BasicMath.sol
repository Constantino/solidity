// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract BasicMath {
    function adder(
        uint _a,
        uint _b
    ) external pure returns (uint sum, bool error) {
        unchecked {
            sum = _a + _b;
            error = sum < _a;
        }
    }

    function subtractor(
        uint _a,
        uint _b
    ) external pure returns (uint difference, bool error) {
        if (_b > _a) {
            difference = 0;
            error = true;
        } else {
            difference = _a - _b;
            error = false;
        }
    }
}
