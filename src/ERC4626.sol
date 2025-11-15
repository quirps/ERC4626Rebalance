pragma solidity ^0.8.0;

import {AssetERC20} from "./AssetERC20.sol";
import {IERC4626} from "./IERC4626.sol";  
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC4626 is AssetERC20, IERC4626 {
    uint256 assets;
    IERC20 immutable assetAddress; 
    constructor(address _assetAddress, string memory name, string memory symbol) AssetERC20(name,symbol) {
        //burn 1000 assets for safeguarding initial donate attack
        assetAddress = IERC20(_assetAddress);
    }
    //View
    //======================

    /**
        Returns the ERC20 token address of the underlying asset
     */
    function asset() public view returns (address assetTokenAddress_) {
        return assetTokenAddress_;
    }

    function totalAssets() public view returns (uint256 totalManagedAssets_) {
        /**
            Needs to be implemented
         */
    }
    function convertToShares(uint256 assets) public view returns (uint256 shares_){

        /**
            Display how many shares would be produced given an amount of assets. Assets
            refers to the raw assets unlike total assets which includes fees and yields.
         */
    }
     function convertToAssets(uint256 shares) public view returns (uint256 assets_){
        
    }
    /**
        Max amount of the underlying asset that can be deposited into the vault for the receiver through a deposit call. 
     */
    function maxDeposit(
        address receiver
    ) public view returns (uint256 maxAssets) {}

    function previewDeposit(
        uint256 assets
    ) public view returns (uint256 shares) {}

    function deposit(
        uint256 assets,
        address receiver
    ) public returns (uint256 shares_) {}

    function maxMint(
        address receiever
    ) public view returns (uint256 maxShares_) {}
    function previewMint(
        uint256 shares
    ) public view returns (uint256 assets_) {}
    function mint(
        uint256 shares,
        address receiver
    ) public returns (uint256 assets) {}
    function maxWithdraw(
        address owner
    ) public view returns (uint256 maxAssets_) {}
    function previewWithdraw(
        uint256 assets
    ) public view returns (uint256 shares_) {}
    function withdraw(
        uint256 assets,
        address receiver,
        address owner
    ) public returns (uint256 shares_) {}
    function maxRedeem(
        address owner
    ) public view returns (uint256 maxShares_) {}
    function previewRedeem(
        uint256 shares
    ) public view returns (uint256 assets_) {}
    function redeem(
        uint256 shares,
        address receiver,
        address owner
    ) public returns (uint256 assets_) {}
}
