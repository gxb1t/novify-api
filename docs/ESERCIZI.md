# Esercizi — Git e GitHub in pratica

> 📌 **Tieni aperta questa pagina per tutta la lezione.** Se ti perdi, rileggi da qui invece di aspettare: quasi tutte le risposte sono in questo file, inclusa la sezione [Quando qualcosa non funziona](#quando-qualcosa-non-funziona) in fondo.

Nella lezione precedente Git l'hai **visto**. Oggi lo **usi**: alla fine della giornata il tuo nome sarà nella storia di questo repository, in modo permanente e verificabile.

Ti serve anche `GIT-CHEATSHEET.md`: ci sono tutti i comandi.

---

## Prima di cominciare: dove sei?

Apri il terminale (**Git Bash** su Windows) **dentro la cartella `novify-api`** e scrivi:

```
git status
```

- Se leggi `On branch main` e `nothing to commit, working tree clean` → ✅ sei a posto, vai al Giro 1.
- Se leggi `not a git repository` → sei nella cartella sbagliata. Spostati dentro `novify-api` con `cd novify-api`.
- Se non hai proprio la cartella → clonala:
  ```
  git clone https://github.com/gxb1t/novify-api.git
  cd novify-api
  ```

> 💡 In alternativa al terminale puoi usare il pannello **Source Control** di VS Code o Antigravity: sono gli stessi passi, con dei click. Scegli quello con cui ti trovi meglio e **resta su quello** per tutta la lezione: mescolare i due confonde.

---

## Giro 1 — La Pull Request

### Obiettivi

Al termine saprai: creare un branch, registrare una modifica in un commit, inviarla su GitHub, proporla con una Pull Request, e **rivedere il lavoro di un altro**.

### Consegna

Il docente ti ha assegnato in chat **una riga del `BACKLOG.md`** e **il nome della persona di cui rivedrai la PR**. La tua riga descrive un endpoint dell'API di Novify: prenotandola, dichiari che quel pezzo lo prendi in carico tu.

> ⚠️ **Tocca solo la tua riga.** In questo giro non ci devono essere conflitti: se ne vedi uno, hai modificato la riga di qualcun altro.

### I passi

**1. Parti da `main` aggiornato e crea il tuo branch**

```
git switch main
git pull
git switch -c nome-cognome
```

Usa davvero il tuo nome, tutto minuscolo e con il trattino: `mario-rossi`. Il branch è tuo, nessun altro ci lavora.

**2. Prenota la tua riga**

Apri `BACKLOG.md` nell'editor. Trova la tua riga e scrivi il tuo nome dentro le parentesi in fondo:

```diff
- 1. [ ] `GET /api/v1/tracks` — lista dei brani ( )
+ 1. [ ] `GET /api/v1/tracks` — lista dei brani (Mario Rossi)
```

Salva il file.

**3. Guarda cosa hai cambiato — non saltare questo passo**

```
git diff
```

Devi vedere **una riga rossa e una verde**: la tua. Se ne vedi altre, hai toccato qualcosa per sbaglio: vai alla sezione dei problemi, si recupera in un secondo.

**4. Registra la modifica**

```
git add BACKLOG.md
git commit -m "prenota il task GET /api/v1/tracks"
```

Nel messaggio metti il **tuo** endpoint. Un messaggio di commit dice *cosa* hai fatto: fra sei mesi deve essere comprensibile senza aprire il file.

**5. Manda il tuo branch su GitHub**

```
git push -u origin nome-cognome
```

> 🪟 Su Windows, la **prima volta** si apre il browser per il login a GitHub: è normale, non è un errore. Accedi e autorizza.

📣 **Scrivi `push ok` in chat.**

**6. Apri la Pull Request**

Vai su https://github.com/gxb1t/novify-api. Comparirà in cima una fascia gialla con **Compare & pull request**: cliccala, poi **Create pull request**.

Se la fascia non c'è: *Pull requests* → *New pull request* → scegli il tuo branch → *Create*.

📣 **Incolla il link della tua PR in chat.** Serve a te e serve a chi deve rivederla.

**7. Rivedi la PR del tuo compagno** ← *la parte che conta di più*

Trova in chat il link della persona che ti è stata assegnata. Aprilo, poi:

1. clicca sulla scheda **Files changed**: vedi esattamente cosa ha cambiato;
2. controlla che abbia toccato **solo la sua riga**;
3. clicca **Review changes** in alto a destra, scrivi un commento breve (`ok per me`, oppure quello che hai notato), scegli **Approve** e conferma.

> Nessuno approva la propria PR. È la regola del repo, non una cortesia: nel lavoro vero il codice entra sempre passando dagli occhi di qualcun altro.

**8. Merge**

Quando la tua PR ha ricevuto l'approvazione, torna sulla tua e clicca **Merge pull request** → **Confirm merge**.

✅ **Il tuo nome è ora nella storia di `main`.** Verificalo:

```
git switch main
git pull
git log --oneline
```

---

## Giro 2 — Il conflitto

> ⏸️ **Non partire da solo.** Questo giro funziona solo se partiamo tutti insieme: aspetta il via del docente.

### Obiettivi

Provocare un conflitto di proposito, capire cosa Git sta chiedendo, e risolverlo.

### Perché aspettare il via

Il conflitto nasce solo se **tutti creano il branch prima che qualcuno faccia il merge**. Chi parte in ritardo si ritrova la modifica già fatta e non vede niente — e si perde l'unica cosa che questo giro serve a mostrare.

### I passi

**1. Al via del docente, crea il secondo branch**

```
git switch main
git pull
git switch -c nome-cognome-2
```

📣 **Scrivi `fatto` in chat, e fermati qui.** Si riparte quando ci sono tutti.

**2. Modifica la riga della priorità**

In cima a `BACKLOG.md` c'è:

```
> **PRIORITÀ DI OGGI:** ______________________
```

Riscrivila con il **tuo** task. Tutti stanno scrivendo sulla stessa riga: è esattamente questo il punto.

> ⚠️ Tocca **solo** questa riga. Le prenotazioni del giro 1, più in basso, lasciale stare.

**3. Commit, push e PR, come nel giro 1**

```
git add BACKLOG.md
git commit -m "aggiorna la priorità di oggi"
git push -u origin nome-cognome-2
```

Poi apri la Pull Request su GitHub.

**4. Il docente ne fa entrare una sola**

Da quel momento tutte le altre sono **in conflitto**. Se la tua non è quella scelta: benissimo, è quello che volevamo.

**5. Porta il conflitto sul tuo computer**

```
git pull origin main
```

Ora Git ti dice `CONFLICT`. **Non hai rotto niente.**

**6. Risolvi**

Apri `BACKLOG.md`. Troverai qualcosa così:

```
<<<<<<< HEAD
> **PRIORITÀ DI OGGI:** il mio task
=======
> **PRIORITÀ DI OGGI:** il task di un altro
>>>>>>> main
```

Git ha due versioni della stessa riga e **si rifiuta di scegliere al posto tuo**. Quello che vedi non è un errore: è una domanda.

Rispondi così: **tieni una sola riga** (o scrivine una che le unisca) e **cancella tutte e tre le righe di marcatori** — `<<<<<<<`, `=======`, `>>>>>>>`. Nel file finale non devono restare.

Salva, poi:

```
git add BACKLOG.md
git commit
git push
```

> 💡 Se dopo `git commit` si apre un editor con un messaggio già scritto, va benissimo così: salva e chiudi. In VS Code: `Ctrl+S`, poi chiudi la scheda.

---

## Percorso locale — se il push non funziona

> Per chi ha un errore **403**, un invito non ancora accettato, o problemi di login.

**Non restare a guardare.** La maggior parte di Git vive sul tuo computer e non ha bisogno di GitHub: fai questi esercizi adesso, il push lo sistemiamo dopo. Non perdi niente — il lavoro resta e lo invierai quando l'accesso è a posto.

**1.** Crea il branch e prenota la tua riga (passi 1–4 del Giro 1: si fermano tutti prima del push).

**2.** Guarda la storia del progetto e cerca di leggerla:
```
git log --oneline
```

**3.** Confronta il tuo branch con `main` — cosa hai cambiato tu rispetto a lì:
```
git diff main
```

**4.** Fai un secondo commit: aggiungi una riga tua in fondo al `BACKLOG.md`, poi `add` e `commit`. Ora `git log --oneline` mostra due commit tuoi.

**5.** Prova a spostarti avanti e indietro fra le due linee di lavoro e guarda il file cambiare sotto i tuoi occhi:
```
git switch main
git switch nome-cognome
```

**6.** Scrivi in chat l'errore esatto che ti compare al push, copiandolo per intero. Lo risolviamo insieme.

---

## Esercizi extra — se hai finito

Non startene fermo: questi valgono quanto il resto, e il primo aiuta i tuoi compagni.

**1. Fai una review vera.** Torna sulle PR aperte in chat e leggine una che non ti era stata assegnata. In *Files changed*, passa il mouse su una riga e clicca il **+** blu: puoi commentare **quella riga specifica**. È così che si discute il codice in azienda.

**2. Scopri chi ha scritto cosa.** Su GitHub apri `BACKLOG.md` e clicca **Blame**: per ogni riga vedi chi l'ha toccata per ultimo e con quale commit. Trova la riga di un compagno e risali al suo commit. Da terminale è `git blame BACKLOG.md`.

**3. Verifica che il `.gitignore` funzioni davvero.** Crea nella cartella un file `.env` con dentro:
```
CHIAVE_SEGRETA=123456
```
Poi lancia `git status`. **Non deve comparire.** È il meccanismo che impedisce a una chiave vera di finire pubblicata: guarda `.gitignore` e trova la riga che lo esclude.

**4. Rileggi il tuo commit.** Trova il suo codice con `git log --oneline`, poi:
```
git show <le-prime-7-lettere-del-codice>
```
Vedi messaggio, autore, data e la modifica esatta. Questa è la "fotografia" di cui parlavano le slide.

**5. Correggi il messaggio dell'ultimo commit.** Se l'hai scritto male:
```
git commit --amend -m "un messaggio migliore"
```
⚠️ Solo se **non** hai ancora fatto il push: riscrive la storia, e la storia già condivisa non si riscrive.

---

## Quando qualcosa non funziona

| Cosa vedi | Cosa significa | Cosa fai |
|---|---|---|
| `403` / `Permission denied` | Non sei ancora collaboratore, o non hai accettato l'invito | Controlla la mail e https://github.com/notifications → *Accept invitation*. Poi riprova. Intanto fai il **percorso locale** |
| `Support for password authentication was removed` | Stai usando la password | Non serve: su Windows il login si apre nel browser, su Linux usa `gh auth login` |
| `git: command not found` | Terminale sbagliato o Git non installato | Su Windows usa **Git Bash**, non il Prompt dei comandi |
| **Ho modificato la riga sbagliata** | Distrazione | `git checkout BACKLOG.md` — annulla le modifiche non ancora committate e riparti. Non hai perso nulla |
| `Your branch is behind 'origin/main'` | Qualcuno ha fatto merge dopo di te | `git pull` e vai avanti |
| `CONFLICT` nel **giro 1** | Hai toccato la riga di un altro | `git merge --abort` — annulla l'unione e torna com'eri. Poi rifai la modifica sulla riga giusta |
| `error: failed to push some refs` | Il remoto ha commit che tu non hai | `git pull origin main`, risolvi se serve, poi `git push` |
| Si è aperto un editor strano a tutto schermo | È `vim`, l'editor predefinito | Premi `Esc`, scrivi `:wq` e premi Invio |
| **Non capisco cosa sta succedendo** | Capita a tutti | `git status` te lo dice quasi sempre. Se non basta, **incolla in chat l'output completo** — non riassumerlo |

> La regola d'oro di oggi: **incolla l'errore per intero in chat.** Un errore letto insieme si risolve in trenta secondi; un errore riassunto a memoria ne costa dieci minuti.
