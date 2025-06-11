// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract ArraysExercise {
    uint256[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    address[] senders;
    uint256[] timestamps;
    uint256 timestampsLen;

    function getNumbers() public view returns (uint256[] memory) {
        return numbers;
    }

    function resetNumbers() public {
        numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    }

    function appendToNumbers(uint256[] calldata _toAppend) public {
        for (uint256 i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    function saveTimestamp(uint256 _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    function afterY2K()
        public
        view
        returns (uint256[] memory, address[] memory)
    {
        uint256 arrayLen = _getLenOfFilteredArray();
        uint256[] memory timestampsResult = new uint256[](arrayLen);
        address[] memory sendersResult = new address[](arrayLen);
        uint256 cursor = 0;

        for (uint256 i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                timestampsResult[cursor] = timestamps[i];
                sendersResult[cursor] = senders[i];
                cursor++;
            }
        }

        return (timestampsResult, sendersResult);
    }

    function _getLenOfFilteredArray() internal view returns (uint256) {
        uint256 _timestampLen = 0;

        for (uint256 i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                _timestampLen++;
            }
        }

        return _timestampLen;
    }

    function resetSenders() public {
        senders = new address[](0);
    }

    function resetTimestamps() public {
        timestamps = new uint256[](0);
    }
}
