pragma solidity ^0.8.0;

import {ERC20} from "./ERC20.sol";
import {IERC4626} from "./IERC4626.sol";  

contract ERC4626 is ERC20, IERC4626 {
    address immutable assetTokenAddress;
    constructor(address _assetTokenAddress) {
        assetTokenAddress = _assetTokenAddress;
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
    ) public nonpayable returns (uint256 shares_) {}

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
