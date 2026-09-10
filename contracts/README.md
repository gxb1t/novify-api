# Contratti — Novify su Ethereum

Qui vivono i contratti Solidity di Novify: quelli scritti e mostrati a lezione. Il docente li
pubblica su `main` **a fine di ogni lezione**, così chi rifà a casa trova il codice esatto che
ha visto, e chi si è perso un passaggio riparte da qui con un `git pull`.

## Come si aprono

I contratti si scrivono e si compilano su **Remix** (https://remix.ethereum.org): nel browser,
senza installare niente. Per lavorare su un file di questa cartella:

1. apri Remix e crea un file con lo stesso nome dentro `contracts/`;
2. incolla il contenuto del file che trovi qui;
3. compila (`Solidity Compiler`) e, quando serve, deploya (`Deploy & Run`).

## I test

I test vanno in `contracts/test/`, con il nome che finisce per `_test.sol`: sono i test del
plugin **Solidity Unit Testing** di Remix, si attiva dal *Plugin Manager*. Sono scritti in
Solidity, come i contratti: nessuna installazione, nessun linguaggio nuovo.

> La regola del blocco: **l'agente scrive, i test decidono.** Il codice generato da un agente AI
> non è né buono né cattivo finché un test non lo mette alla prova.

## Contratti su Sepolia

Gli indirizzi dei contratti pubblicati sulla testnet, man mano che li deployiamo:

| Contratto | Indirizzo | Etherscan | Lezione |
|-----------|-----------|-----------|---------|
| _(il primo arriva con la lezione 07)_ | | | |

⚠️ Nessuna chiave privata finisce mai in questi file, né in nessun altro file del repo. Le chiavi
stanno in `.env`, che il `.gitignore` esclude: vedi `.env.example`.
