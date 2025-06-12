// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract GarageManager {
    error BadCarIndex(uint index);

    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }
    mapping(address => Car[]) public garage;

    function addCar(
        string memory make,
        string memory model,
        string memory color,
        uint numberOfDoors
    ) public {
        garage[msg.sender].push(
            Car({
                make: make,
                model: model,
                color: color,
                numberOfDoors: numberOfDoors
            })
        );
    }

    function getMyCars() public view returns (Car[] memory) {
        Car[] memory cars = new Car[](garage[msg.sender].length);

        for (uint i = 0; i < garage[msg.sender].length; i++) {
            cars[i] = garage[msg.sender][i];
        }

        return cars;
    }

    function getUserCars(address _address) public view returns (Car[] memory) {
        Car[] memory _cars = new Car[](garage[_address].length);
        for (uint i = 0; i < garage[_address].length; i++) {
            _cars[i] = garage[_address][i];
        }
        return _cars;
    }

    function updateCar(
        uint _index,
        string calldata _make,
        string calldata _model,
        string calldata _color,
        uint _numberOfDoors
    ) external {
        if (_index >= garage[msg.sender].length) {
            revert BadCarIndex(_index);
        }
        garage[msg.sender][_index] = Car(_make, _model, _color, _numberOfDoors);
    }

    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}
