// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint256 private seed;

    mapping(address => uint256) public lastWavesAt;

    event WaveCreated(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address owner;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() payable {
        console.log("Yo yo, I am a contract made by me !");
        seed = (block.difficulty + block.timestamp + seed) % 100;

    }

    function wave(string memory _message) public payable {

        require(lastWavesAt[msg.sender]+ 1 minutes < block.timestamp,
        "Wait 1 more minute..."
        );


        lastWavesAt[msg.sender]= block.timestamp;



        totalWaves++;

        console.log("%s has waved w/ message : %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit WaveCreated(msg.sender, block.timestamp, _message);

        seed = (block.difficulty + block.timestamp + seed) % 100;

        if(seed<=50){

            console.log("Congrats!! %s won!",msg.sender);


        uint256 prizeAmount = 0.0001 ether;

        require(
            prizeAmount <= address(this).balance,
            "LOL! No money left in the contract!!"
        );

        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw ether from the contract.");
    }
        }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("Total waves: %s", totalWaves);
        return totalWaves;
    }
}


