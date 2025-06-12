// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "./SillyStringUtils.sol";

contract ImportsExercise {
    SillyStringUtils.Haiku public haiku;

    function saveHaiku(
        string memory _line1,
        string memory _line2,
        string memory _line3
    ) public {
        haiku = SillyStringUtils.Haiku({
            line1: _line1,
            line2: _line2,
            line3: _line3
        });
    }

    function getHaiku() public view returns (SillyStringUtils.Haiku memory) {
        SillyStringUtils.Haiku memory _temp = SillyStringUtils.Haiku({
            line1: haiku.line1,
            line2: haiku.line2,
            line3: haiku.line3
        });
        return _temp;
    }

    function shruggieHaiku()
        public
        view
        returns (SillyStringUtils.Haiku memory)
    {
        SillyStringUtils.Haiku memory _temp = SillyStringUtils.Haiku({
            line1: haiku.line1,
            line2: haiku.line2,
            line3: SillyStringUtils.shruggie(haiku.line3)
        });
        return _temp;
    }
}
