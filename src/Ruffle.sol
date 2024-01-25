// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {VRFCoordinatorV2Interface} from "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

/**
 * @title A sample ruffle contract
 * @author Lice
 * @notice This contract is for creating a sample ruffle
 * @dev Implements Chainlink VRFv2
 */
contract Ruffle {
    error Raffle__NotEnoughFees();

    /** State Variables */
    uint16 private constant REQUEST_CONFIRMATIONS = 3;
    uint32 private constant NUM_WORDS = 1;

    uint256 private immutable i_entranceFee;
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    bytes32 private immutable i_gasLane;
    address payable[] private s_players;
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    uint64 private immutable i_subscriptionId;
    uint32 private immutable i_callbackGasLimit;

    /** Events */

    event EnteredRuffle(address indexed player);

    constructor(
        uint256 entranceFee,
        uint256 interval,
        VRFCoordinatorV2Interface vrfCoordinator,
        bytes32 gasLane,
        uint64 subscriptionId,
        uint32 callbackGasLimit
    ) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
        i_vrfCoordinator = vrfCoordinator;
        i_gasLane = gasLane;
        i_subscriptionId = subscriptionId;
        i_callbackGasLimit = callbackGasLimit;
    }

    function enterRuffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough fees");
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughFees();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRuffle(msg.sender);
    }

    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert();
        }
        uint256 requestId = i_vrfCoordinator.requestRandomWords(
            i_gasLane, // kay hash
            i_subscriptionId, // 8843
            REQUEST_CONFIRMATIONS, // 越多越安全，但是越多越慢
            i_callbackGasLimit, // 返回时消耗的gas上限
            NUM_WORDS // 返回几个数字
        );
    }

    /** Getter Functions */

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
