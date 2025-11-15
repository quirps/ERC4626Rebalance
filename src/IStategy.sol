pragma solidity ^0.8.9;

interface IStrategyVault{
    /**
    Returns underlying asset's address this strategy is managing
     */
    function asset() external view returns (address);

/**
    Gives the total balance of the vault including yields and minus 
    strategy managerial fees
 */
    function balanceOfVault() external view returns (uint256);

    /**
        Deposit assets from the vault 
        @dev must be callable ONLY by the vault
        @param amount the amount of asset to deposit
     */
    function deposit( uint256 assets) external;

    /**
        @notice withdraws assets from the strategy
        @dev must be callable ONLY by the vault
        * Must transfer the amount assets back to the vault
        @param assets amount of assets to be withdrawn

     */
     function withdraw( uint256 assets) external;

    /**
        @notice Triggers the strategy to harvest yield, pay feds, and compound. 
        @dev MUST be callabel only by the stategist (or authorized role therof)
        @return profit the amount of profit in units of asset realized during harvest
        *
     */
     function harvest() external returns (uint256 profit);
}