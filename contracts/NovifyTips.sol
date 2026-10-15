// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title NovifyTips — mance in ETH agli artisti di Novify
/// @notice Versione v1. Evolve dalla v0 che serviva **un artista solo**, fissato dal costruttore.
/// @dev Che cosa cambia rispetto alla v0:
///      - `address public artist` è diventato un `mapping`: il contratto non memorizza piu' solo *un* artista
///      - il `constructor` è vuoto
///      - `tip()` ha due parametri, per specificare *a chi* inviare la mancia.

contract NovifyTips {
    // --- I dati di un artista -------------------------------------------------
    // Una `struct` è il posto dove stanno insieme i dati che descrivono UN concetto.
    // Senza, servirebbero tre variabili parallele.

    struct Artist {
        string name;             // Nome Artista
        uint256 totalReceived;   // quanto ha ricevuto di mance, in wei.
        bool registered;         // c'è o non c'è. Serve, e il perché è la riga più istruttiva del file
    }

    // --- Variabili di Stato: vivono nella blockchain ------------

    /// @notice Da indirizzo ad artista. È la riga che sostituisce `address public artist`.
    /// @dev Un mapping NON si può scorrere: in realtà contiene già *tutti* gli indirizzi
    ///      possibili, inizializzati a zero. Non c'è un elenco da percorrere perché non
    ///      c'è un elenco.
    mapping(address => Artist) public artists;

    /// @notice Gli indirizzi registrati, per poterli enumerare.
    /// @dev È il motivo per cui quasi ogni contratto serio ha un mapping **e** un array:
    ///      il mapping risponde a «questo indirizzo chi è?», l'array a «chi c'è?».
    address[] public artistList;

    /// @notice Quanto e mancie sono state date in totale da questo contratto.
    uint256 public totalCollected;

    // Dalla v0 è sparito `lastSupporter`: con più artisti, "l'ultimo" di chi?

    // --- Eventi ---------------------------------------------------------------
    // Righe di registro che vengono stampate nella scheda Logs di Etherscan.

    event ArtistRegistered(address indexed artist, string name);
    event TipSent(address indexed from, address indexed to, uint256 amount, string message);

    // --- Funzioni -------------------------------------------------------------

    /// @notice Gira una volta sola, quando il contratto viene pubblicato.
    /// @dev Vuoto: nella v0 qui si fissava l'unico artista
    constructor() {}

    /// @notice Ti registri come artista. Non c'è nessuno che approva: chi si vuole registrare si registra.
    /// @param name come l'artista vuole essere chiamato
    function register(string calldata name) external {
        // require #1 — due volte no.
        // Senza il campo `registered`, questo controllo non si potrebbe scrivere: un indirizzo
        // mai visto e uno registrato con i campi a zero sarebbero indistinguibili.
        require(!artists[msg.sender].registered, "Sei gia' registrato");

        artists[msg.sender] = Artist(name, 0, true);
        artistList.push(msg.sender);

        emit ArtistRegistered(msg.sender, name);
    }

    /// @notice Manda una mancia a un artista registrato.

    /// @dev `payable`: senza, la funzione rifiuterebbe gli ETH in arrivo.
    ///      L'importo NON è un parametro — si trova nei dati di transazione, in `msg.value`.
    /// @param artist a chi va la mancia
    /// @param message due parole che restano nel registro insieme alla mancia
    function tip(address artist, string calldata message) external payable {
        // require #2 — non si manda nulla ad artisti non registrati.
        require(artists[artist].registered, "Questo artista non esiste");

        // require #3 — una mancia da zero non e' una mancia.
        require(msg.value > 0, "Manda almeno qualcosa");

        // Gli ETH sono gia' arrivati al contratto: qui scriviamo solo **di chi sono**.
        artists[artist].totalReceived += msg.value;
        totalCollected += msg.value;

        emit TipSent(msg.sender, artist, msg.value, message);
    }

    /// @notice Quanti artisti si sono registrati.
    /// @dev `artistList.length` sarebbe leggibile comunque, ma con un nome che non dice niente.
    function artistCount() external view returns (uint256) {
        return artistList.length;
    }

}
