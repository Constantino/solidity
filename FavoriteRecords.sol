// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract FavoriteRecords {
    error NotApproved(string);

    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) public userFavorites;
    mapping(address => uint256) public counterOfUserFavorites;
    string[] public recordsNames;

    constructor() {
        string[] memory records = new string[](9);
        records[0] = "Thriller";
        records[1] = "Back in Black";
        records[2] = "The Bodyguard";
        records[3] = "The Dark Side of the Moon";
        records[4] = "Their Greatest Hits (1971-1975)";
        records[5] = "Hotel California";
        records[6] = "Come On Over";
        records[7] = "Rumours";
        records[8] = "Saturday Night Fever";

        for (uint256 i = 0; i < records.length; i++) {
            approvedRecords[records[i]] = true;
            recordsNames.push(records[i]);
        }
    }

    function getApprovedRecords() public view returns (string[] memory) {
        return recordsNames;
    }

    function addRecord(string memory _name) public {
        if (approvedRecords[_name]) {
            userFavorites[msg.sender][_name] = true;
            counterOfUserFavorites[msg.sender] =
                counterOfUserFavorites[msg.sender] +
                1;
        } else {
            revert NotApproved(_name);
        }
    }

    function getUserFavorites(
        address _address
    ) public view returns (string[] memory) {
        string[] memory _records = new string[](
            counterOfUserFavorites[_address]
        );
        uint256 cursor;
        for (uint256 i = 0; i < recordsNames.length; i++) {
            if (userFavorites[_address][recordsNames[i]] == true) {
                _records[cursor] = recordsNames[i];
                cursor++;
            }
        }
        return _records;
    }

    function resetUserFavorites() public {
        for (uint256 i = 0; i < recordsNames.length; i++) {
            userFavorites[msg.sender][recordsNames[i]] = false;
        }
        counterOfUserFavorites[msg.sender] = 0;
    }
}
