# Proveably Random Raffle Contracts

## About

This cede is to create a provably random raffle contract lottery. The contract will be deployed on the Ethereum blockchain and will be able to be interacted with via a web3 interface. The contract will be able to accept a list of addresses and a list of values. The contract will then be able to randomly select a winner from the list of addresses and send the value to the winner. The contract will also be able to be paused and unpaused by the owner of the contract.

## What we want it to do

1. users can enter by paying for an ticket
   1. The ticket fees are going to go to the winner during the draw
2. After X period of time, the lottery will automatically draw a winner
   1. And this will be done programmatically
3. Using Chainlink VRF & Chainlink Automation
   1. Chainlink VRF -> Randomness
      // but the random number is actually generated out of the blockchain, and that is the problem, because someone can read it before it is written to the blockchain
   2. Chainlink Automation -> Time based trigger
