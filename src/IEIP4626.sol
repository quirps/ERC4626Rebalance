pragma solidity ^0.8.0;

interface ERC4626  {

    /**
        Returns the ERC20 token address of the underlying asset
     */
    function asset() external view returns (address assetTokenAddress_);

    function totalAssets() external view returns( uint256 totalManagedAssets_);
    /**
        Max amount of the underlying asset that can be deposited into the vault for the receiver through a deposit call. 
     */
    function maxDeposit(address receiver) external view returns(uint256 maxAssets);

    function previewDeposit( uint256 assets ) external view returns(uint256 shares);

    function deposit( uint256 assets, address receiver) external returns ( uint256 shares_);
    function maxMint( address receiever) external view returns (uint256 maxShares_);
    function previewMint( uint256 shares) external view returns( uint256 assets_);
    function mint(uint256 shares, address receiver) external returns( uint256 assets );
    function maxWithdraw(address owner) external view returns (uint256 maxAssets_);
    function previewWithdraw(uint256 assets) external view returns( uint256 shares_);
    function withdraw(uint256 assets, address receiver, address owner) external returns(uint256 shares_);
    function maxRedeem(address owner) external view returns(uint256 maxShares_);
    function previewRedeem(uint256 shares) external view returns(uint256 assets_);
    function redeem(uint256 shares, address receiver, address owner) external returns (uint256 assets_);

}