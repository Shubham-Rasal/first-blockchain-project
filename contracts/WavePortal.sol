// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    event WaveCreated(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address owner;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() {
        console.log("Yo yo, I am a contract made by me !");
    }

    function wave(string memory _message) public payable {
        totalWaves++;

        console.log("%s has waved w/ message : %s", msg.sender, _message);

        waves.push(
            Wave{
                owner: msg.sender,
                message: _message,
                timestamp: block.timestamp
            }
        );

        emit WaveCreated(msg.sender, block.timestamp, _message);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("Total waves: %s", totalWaves);
        return totalWaves;
    }
}
