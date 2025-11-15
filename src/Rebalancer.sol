pragma solidity ^0.8.0;

import {ERC4626} from "./ERC4626.sol"; 

contract Rebalancer is ERC4626{
    constructor(address assetAddress, string memory assetName, string memory assetSymbol) ERC4626(assetAddress,assetName, assetSymbol){}
}