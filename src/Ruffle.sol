// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/**
 * @title A sample ruffle contract
 * @author Lice
 * @notice This contract is for creating a sample ruffle
 * @dev Implements Chainlink VRFv2
 */
contract Ruffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRuffle() public payable {}

    function pickWinner() public {}

    /** Getter Functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
