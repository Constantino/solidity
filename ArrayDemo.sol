// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.17;

contract ArrayDemo {
    uint256 numEven;
    uint256[] public numbers;

    function getEvenNumbers() external view returns (uint256[] memory) {
        uint256[] memory results = new uint256[](numEven);
        uint256 cursor = 0;

        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                results[cursor] = numbers[i];
                cursor++;
            }
        }

        return results;
    }

    function debugLoadArray(uint256 _number) public {
        for (uint256 i = 0; i < _number; i++) {
            numbers.push(i);
            if (i % 2 == 0) {
                numEven++;
            }
        }
    }

    function _getEvenNumbers() internal view returns (uint256) {
        uint256 result;

        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                result++;
            }
        }

        return result;
    }
}
