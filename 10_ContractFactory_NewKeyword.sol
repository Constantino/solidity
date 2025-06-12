// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract AddressBook is Ownable {
    error ContactNotFound(uint);

    struct Contact {
        uint256 id;
        string firstName;
        string lastName;
        uint[] phoneNumbers;
    }

    Contact[] public contacts;
    mapping(uint256 => uint256) indexToId;

    constructor(address _initialOwner) Ownable(_initialOwner) {}

    function addContact(
        uint256 _id,
        string memory _firstName,
        string memory _lastName,
        uint[] calldata _phoneNumbers
    ) public onlyOwner {
        indexToId[_id] = contacts.length;
        contacts.push(Contact(_id, _firstName, _lastName, _phoneNumbers));
    }

    function deleteContact(uint256 _id) public onlyOwner {
        if (contacts[indexToId[_id]].id == 0) {
            revert ContactNotFound(_id);
        }
        delete contacts[indexToId[_id]];
    }

    function getContact(uint _id) public view returns (Contact memory) {
        if (contacts[indexToId[_id]].id == 0) {
            revert ContactNotFound(_id);
        }

        return contacts[indexToId[_id]];
    }

    function getAllContracts() public view returns (Contact[] memory) {
        uint256 deletedAmount;
        for (uint i = 0; i < contacts.length; i++) {
            if (contacts[i].id == 0) {
                deletedAmount++;
            }
        }
        Contact[] memory _temp = new Contact[](contacts.length - deletedAmount);
        uint256 cursor;
        for (uint i = 0; i < contacts.length; i++) {
            if (contacts[i].id != 0) {
                _temp[cursor] = contacts[i];
                cursor++;
            }
        }

        return _temp;
    }
}

contract AddressBookFactory {
    function deploy() public returns (address) {
        AddressBook _instance = new AddressBook(msg.sender);
        return address(_instance);
    }
}
