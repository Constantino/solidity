// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract Mappings {
    mapping(address => uint256) public favoriteNumbers;
    address[] addressesOfFavs;

    function saveFavoriteNumber(uint256 _number) public {
        if (favoriteNumbers[msg.sender] == 0) {
            addressesOfFavs.push(msg.sender);
        }
        favoriteNumbers[msg.sender] = _number;
    }

    function returnAllFavorites() public view returns (uint256[] memory) {
        uint256[] memory _favoriteNumbers = new uint256[](
            addressesOfFavs.length
        );
        for (uint256 i = 0; i < addressesOfFavs.length; i++) {
            _favoriteNumbers[i] = favoriteNumbers[addressesOfFavs[i]];
        }
        return _favoriteNumbers;
    }
}
