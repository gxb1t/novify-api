# Indirizzi — i wallet della classe su Sepolia

Qui ognuno scrive il proprio **indirizzo Ethereum** sulla testnet Sepolia. Utile per scambiarci qualcosa on-chain: token `NOVI`, ETH di test, mance.

## Cosa si scrive (e cosa no)

- L'**indirizzo pubblico** del tuo account: `0x` seguito da 40 caratteri esadecimali, 42 in
  tutto. In MetaMask lo copi cliccando sul nome dell'account, in alto.
- Copialo e incollalo, **non ricopiarlo a mano**: un carattere sbagliato è un altro indirizzo,
  e quello che ci arriva non torna indietro.
- Usa un account **solo di test**, creato per il corso: non quello dove tieni fondi veri.

⚠️ **Mai la chiave privata, mai la seed phrase** (le 12 parole). L'indirizzo è pubblico per
natura: chiunque può vederlo e può solo mandarti qualcosa. Chi ha la chiave privata, invece,
può spendere tutto. Questo repository è pubblico, e la storia di git non si cancella.

## Come si aggiunge il proprio indirizzo

Questa volta **un solo branch per tutta la classe**: `feature/indirizzi`. Lo crea il docente,
ci lavoriamo tutti sopra, e alla fine entra su `main` con **una sola Pull Request**.

1. `git fetch` → `git switch feature/indirizzi` → `git pull`
2. Compila **solo la tua riga**, quella col numero che il docente ti assegna in chat
3. `git add INDIRIZZI.md` → `git commit -m "aggiungi indirizzo di <nome>"`
4. `git pull` → `git push`

Il `git pull` prima del push serve perché nel frattempo qualche compagno avrà già pubblicato
la sua riga: se lo salti, il push viene **rifiutato**. Non è un errore: fai `git pull` e riprova.

> **Se il `git pull` segnala un conflitto**, è perché chi ha la riga accanto alla tua ha
> pubblicato prima di te: Git non sa unire da solo due righe vicine. Apri il file, **tieni
> tutte e due le righe** (la sua e la tua), cancella i marcatori `<<<<<<<` `=======` `>>>>>>>`,
> poi `git add INDIRIZZI.md` → `git commit` → `git push`.

> Non aggiungere né togliere righe, non riallineare la tabella, non toccare le righe degli altri.

## Gli indirizzi

| #  | Nome                  | GitHub | Indirizzo (Sepolia)                        |
|----|-----------------------|--------|--------------------------------------------|
| 1  | Giuseppe Burrai       |        | 0xDDCB8143F515b738E0ee4676b5348EbF476D58AD |
| 2  |                       |        |                                            |
| 3  |                       |        |                                            |
| 4  | Alessandro Bassignani |        | 0xA7D40D3A158d4f51CfcA256F163eD88da41a1adc |
| 5  |                       |        |                                            |
| 6  |                       |        |                                            |
| 7  |                       |        |                                            |
| 8  |                       |        |                                            |
| 9  |                       |        |                                            |
| 10 |                       |        |                                            |
| 11 |                       |        |                                            |
| 12 |                       |        |                                            |
| 13 |                       |        |                                            |
| 14 |                       |        |                                            |
| 15 |                       |        |                                            |
| 16 |                       |        |                                            |

Se il tuo account è ancora a zero, gli ETH di test si prendono dal faucet:
https://sepolia-faucet.pk910.de/ — incolli il tuo indirizzo, lasci lavorare la pagina e poi
riscuoti.

Per controllare che l'indirizzo sia giusto, cercalo su https://sepolia.etherscan.io: deve
comparire il tuo saldo di test.
