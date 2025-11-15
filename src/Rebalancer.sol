pragma solidity ^0.8.0;

import {ERC4626} from "./ERC4626.sol"; 

contract Rebalancer {

    IStrategy immutable strategyManager;
    constructor( address _strategyManager){
        strategyManager = _strategyManager;
    }


}