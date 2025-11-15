// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ERC4626 Tokenized Vault Standard Interface
 * @notice This interface follows the ERC-4626 Tokenized Vault standard.
 * @dev This interface defines the minimal methods a Tokenized Vault must implement
 *      to allow deposits, withdrawals, share minting, and asset redemption
 *      following predictable accounting rules.
 */
interface ERC4626  {

    /**
     * @notice Returns the address of the underlying ERC-20 asset used by the vault.
     * @return assetTokenAddress_ The contract address of the underlying asset token.
     */
    function asset() external view returns (address assetTokenAddress_);

    /**
     * @notice Returns the total amount of underlying assets the vault currently manages.
     * @dev Includes assets managed directly or indirectly by the vault.
     * @return totalManagedAssets_ Total assets under management.
     */
    function totalAssets() external view returns (uint256 totalManagedAssets_);

    /**
     * @notice Returns the maximum amount of assets the `receiver` can deposit into the vault.
     * @dev This may depend on factors such as system limits or vault capacity.
     * @param receiver The address receiving the vault shares.
     * @return maxAssets The maximum assets allowed for deposit.
     */
    function maxDeposit(address receiver) external view returns (uint256 maxAssets);

    /**
     * @notice Simulates the number of shares that would be minted by depositing `assets`.
     * @dev Does not modify state. Useful for UX and off-chain estimations.
     * @param assets The amount of underlying assets to deposit.
     * @return shares The amount of shares that would be minted.
     */
    function previewDeposit(uint256 assets) external view returns (uint256 shares);

    /**
     * @notice Deposits `assets` into the vault on behalf of `receiver`, minting vault shares.
     * @param assets The amount of underlying assets to deposit.
     * @param receiver The address receiving the minted shares.
     * @return shares_ The actual number of shares minted.
     */
    function deposit(uint256 assets, address receiver) external returns (uint256 shares_);

    /**
     * @notice Returns the maximum amount of shares that can be minted for `receiver`.
     * @param receiever The address that would receive the newly minted shares.
     * @return maxShares_ The maximum number of shares that may be minted.
     */
    function maxMint(address receiever) external view returns (uint256 maxShares_);

    /**
     * @notice Simulates the amount of assets required to mint `shares`.
     * @dev Useful for previews and estimations without state changes.
     * @param shares The number of shares to mint.
     * @return assets_ The required assets that must be provided.
     */
    function previewMint(uint256 shares) external view returns (uint256 assets_);

    /**
     * @notice Mints `shares` to `receiver` by providing the required underlying assets.
     * @param shares The number of shares to mint.
     * @param receiver The address receiving the minted shares.
     * @return assets The actual amount of assets pulled from the caller.
     */
    function mint(uint256 shares, address receiver) external returns (uint256 assets);

    /**
     * @notice Returns the maximum amount of underlying assets `owner` may withdraw.
     * @dev Limited by the owner's share balance and vault liquidity.
     * @param owner The address initiating the withdrawal.
     * @return maxAssets_ The maximum assets that can be withdrawn.
     */
    function maxWithdraw(address owner) external view returns (uint256 maxAssets_);

    /**
     * @notice Simulates the number of shares required to withdraw `assets`.
     * @param assets The amount of underlying assets requested.
     * @return shares_ The number of shares that would be burned.
     */
    function previewWithdraw(uint256 assets) external view returns (uint256 shares_);

    /**
     * @notice Withdraws `assets` from the vault, burning the required number of shares.
     * @param assets The amount of assets to withdraw.
     * @param receiver The address receiving the underlying assets.
     * @param owner The address whose shares will be burned.
     * @return shares_ The number of shares actually burned.
     */
    function withdraw(uint256 assets, address receiver, address owner) external returns (uint256 shares_);

    /**
     * @notice Returns the maximum number of shares `owner` may redeem for underlying assets.
     * @param owner The address to check redemption capacity for.
     * @return maxShares_ Maximum redeemable shares.
     */
    function maxRedeem(address owner) external view returns (uint256 maxShares_);

    /**
     * @notice Simulates the amount of assets returned when redeeming `shares`.
     * @param shares The number of shares to redeem.
     * @return assets_ The amount of underlying assets that would be returned.
     */
    function previewRedeem(uint256 shares) external view returns (uint256 assets_);

    /**
     * @notice Redeems `shares` from `owner`, sending underlying assets to `receiver`.
     * @param shares The number of shares to redeem.
     * @param receiver The address receiving the underlying assets.
     * @param owner The address whose shares will be burned.
     * @return assets_ The actual assets returned.
     */
    function redeem(uint256 shares, address receiver, address owner) external returns (uint256 assets_);
}
