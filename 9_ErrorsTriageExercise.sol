// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract ErrorTriageExercise {
    function abs(int x) internal pure returns (int) {
        return x < 0 ? -x : x;
    }
    /**
     * Finds the difference between each uint with it's neighbor (a to b, b to c, etc.)
     * and returns a uint array with the absolute integer difference of each pairing.
     */
    function diffWithNeighbor(
        uint _a,
        uint _b,
        uint _c,
        uint _d
    ) public pure returns (int[] memory) {
        int[] memory results = new int[](3);

        results[0] = abs(int(_a) - int(_b));
        results[1] = abs(int(_b) - int(_c));
        results[2] = abs(int(_c) - int(_d));

        return results;
    }

    /**
     * Changes the _base by the value of _modifier.  Base is always >= 1000.  Modifiers can be
     * between positive and negative 100;
     */
    function applyModifier(
        uint _base,
        int _modifier
    ) public pure returns (int) {
        return int(uint(_base)) + _modifier;
    }

    /**
     * Pop the last element from the supplied array, and return the popped
     * value (unlike the built-in function)
     */
    uint[] arr;

    function popWithReturn() public returns (uint) {
        uint index = arr.length - 1;
        uint value = arr[index];
        arr.pop();
        return value;
    }

    // The utility functions below are working as expected
    function addToArr(uint _num) public {
        arr.push(_num);
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function resetArr() public {
        delete arr;
    }
}
