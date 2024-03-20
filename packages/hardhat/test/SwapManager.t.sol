// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";

contract SwapManagerTest is Test {

    function setUp() public {
        vm.createSelectFork("mainnet");
    }

    function testDemo() public {
        console2.log("testDemo");
    }

    receive() external payable {
        
    }
}
