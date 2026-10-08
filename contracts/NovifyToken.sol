// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title NovifyToken — i token che si guadagnano ascoltando su Novify
/// @notice Si guadagnano ascoltando, si possono bruciare per riscattare un premio.
/// @dev Nessuna maxSupply. I token una volta spesi, vengono bruciati.

contract NovifyToken is ERC20, Ownable {

    /// @notice Emesso a ogni riscatto di token
    /// @param fan address chi sta bruciando i token
    /// @param amount quanti token si stanno bruciando
    /// @param item che cosa ha riscattato il fan con il burn
    event Redeemed(address indexed fan, uint256 amount, string item);

    /// @notice Gira una volta sola.
    /// @dev La supply parte da ZERO: nessun token esiste prima del primo ascolto.
    constructor() ERC20("Novify Token", "NOVI") Ownable(msg.sender) {

    }

    /// @notice Un token non si può dividere: zero decimali.
    /// @dev la libreria di default ne mette 18. Qui sovrascriviamo la scelta.
    function decimals() public pure override returns (uint8) {
        return 0;
    }

    /// @notice Accredita i token guadagnati dopo gli ascolti.
    /// @dev Solo la piattaforma Novify può chiamare questa funzione. Senza il modifier, chiunque si
    ///      potrebbe creare i token da solo.
    /// @param listener address di chi ha guadagnato token
    /// @param amount quantita' di token da accreditare
    function reward(address listener, uint256 amount) external onlyOwner{
        _mint(listener, amount);
    }

    /// @notice Brucia i propri token per riscattare qualcosa.
    /// @dev `_burn` fa scendere `totalSupply`: i token vengono bruciati.
    /// @param amount quanti token bruciare
    /// @param item che cosa si sta riscattando con il burning
    function redeem(uint256 amount, string calldata item) external {
        _burn(msg.sender, amount);
        emit Redeemed(msg.sender, amount, item);
    }
}
