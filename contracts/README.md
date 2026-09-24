# Contratti — Novify su Ethereum

Qui verranno versionati i contratti Solidity di Novify. 

## Come si aprono

I contratti si scrivono e si compilano su **Remix** (https://remix.ethereum.org): nel browser,
senza installare niente. Per lavorare su un file di questa cartella:

1. apri Remix e crea un file con lo stesso nome dentro `contracts/`;
2. incolla il contenuto del file che trovi qui;
3. compila (`Solidity Compiler`) e, quando serve, deploya (`Deploy & Run`).

## I test

I test vanno in `contracts/test/`, con il nome che finisce per `_test.sol`: sono i test del
plugin **Solidity Unit Testing** di Remix, si attiva dal *Plugin Manager*. Sono scritti in
Solidity, come i per contratti: nessuna installazione, nessun linguaggio nuovo.

> La regola del blocco: **l'agente scrive, i test decidono.** Il codice generato da un agente AI
> non è né buono né cattivo finché un test non lo mette alla prova.

## Contratti su Sepolia

Gli indirizzi dei contratti pubblicati sulla testnet, man mano che verranno deployati:

| Contratto | Indirizzo | Etherscan | Lezione |
|-----------|-----------|-----------|---------|
| __ | | | |

⚠️ Nessuna chiave privata deve finire mai in questo file, né in nessun altro file pubblicato sul repository. 
Le chiavi possono stare sul file `.env`, se il `.gitignore` lo esclude: vedi `.env.example`.
