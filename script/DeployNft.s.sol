// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {GoldNFT} from "../src/NFT.sol";

contract DeployNft is Script {
    function run() public returns (address) {
        vm.startBroadcast();
        GoldNFT gold = new GoldNFT();
        gold.setNftUri("ipfs://QmWeGVX8Uo6PopZE1z89dwXUJ1hcpeJQzjRanMARM5xLLE/");
        gold.setMintPrice(0.005 ether);
        vm.stopBroadcast();
        return address(gold);
    }
}
