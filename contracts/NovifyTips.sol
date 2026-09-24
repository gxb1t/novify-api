// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract NovifyTips {

    // --- Stato: vive nello storage della blockchain ---
    address public artist;          // chi riceve le mance; fissato alla pubblicazione
    address public lastSupporter;   // chi ha mandato l'ultima mancia
    uint256 public totalReceived;   // totale ricevuto, in wei (1 ETH = 10^18 wei)

    /// @notice Viene eseguito una volta sola, quando il contratto viene pubblicato.
    /// @param _artist l'indirizzo che riceverà le mance
    constructor(address _artist) {
        artist = _artist;
    }

    /// @notice Invia una mancia. L'importo viaggia con i dati di transazione, non fra i parametri di input.
    /// @dev `payable` è obbligatorio: senza, la funzione rifiuterebbe gli ETH in arrivo.
    function tip() external payable {
        lastSupporter = msg.sender;   // chi ha firmato la transazione: ce lo mette la EVM
        totalReceived += msg.value;   // scrive nello storage → questa chiamata costa gas
    }

}
