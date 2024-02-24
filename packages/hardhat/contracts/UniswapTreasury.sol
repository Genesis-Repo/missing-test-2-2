// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";

contract UniswapTreasury {
    address private constant UNISWAP_TREASURY = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;
    uint256 private constant MINIMUM_BALANCE = 5 ether;

    receive() external payable {
        if (address(this).balance >= MINIMUM_BALANCE) {
            sendToTreasury();
        }
    }

    function sendToTreasury() private {
        Address.sendValue(payable(UNISWAP_TREASURY), address(this).balance);
    }
}