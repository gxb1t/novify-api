// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title NovitasToken - Un token ERC20 conforme sviluppato con OpenZeppelin
/// @notice Fornisce 21 milioni di token NVT con 8 decimali al deployer
contract NovitasToken is ERC20 {

    /// @notice Crea l'intera fornitura di token e la assegna al deployer
    constructor() ERC20("Novitas Token", "NVT") {
        uint8 decimals_ = 8;
        uint256 initialSupply = 21_000_000 * 10 ** decimals_;
        _mint(msg.sender, initialSupply);
    }

    /// @notice Sovrascrive la funzione dei decimali per usare 8 anziché 18
    function decimals() public view virtual override returns (uint8) {
        return 8;
    }
}