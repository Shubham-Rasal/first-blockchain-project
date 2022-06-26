// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

    uint256 totalWaves;

    constructor() {
        console.log("Yo yo, I am a contract made by me !");
    }

    function wave() public payable {
        totalWaves++;
        console.log("%s has waved", msg.sender);
    }

    function getTotalWaves() public view returns(uint256){
        console.log("Total waves: %s", totalWaves);
        return totalWaves;
    }
}