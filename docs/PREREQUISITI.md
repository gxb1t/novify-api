# Prerequisiti e setup — da fare PRIMA della lezione su Git

> ⏱️ Tempo richiesto: **30–40 minuti**. Fallo con calma **a casa**, non il giorno della lezione.
> 😌 Nessuna esperienza richiesta: segui i passi **in ordine**, uno alla volta. Se qualcosa non torna, c'è la sezione [Problemi comuni](#problemi-comuni) in fondo.

Alla lezione costruiremo insieme un progetto usando **Git** (lo strumento con cui si versiona e si collabora sul codice) e **GitHub** (il sito dove il progetto vive online). Perché la lezione parta subito, ognuno deve arrivare con il computer **già pronto**.

---

## ✅ Checklist (spunta tutto prima di venire a lezione)

- [ ] **1.** Ho creato un account **GitHub**
- [ ] **2.** Ho **comunicato il mio username** GitHub al docente
- [ ] **3.** Ho **accettato l'invito** al repository del corso (arriva via email/notifica dopo il punto 2)
- [ ] **4.** Ho installato **Git**
- [ ] **5.** Ho installato **Visual Studio Code** e **Antigravity** (gli editor)
- [ ] **6.** Ho **configurato Git** con nome, email ed editor
- [ ] **7.** Ho impostato l'**autenticazione** a GitHub
- [ ] **8.** Ho **clonato il repository** con successo (test finale)

---

## 1. Crea un account GitHub

1. Vai su **https://github.com/signup**
2. Inserisci **email**, **password** e uno **username** (es. `mario-rossi`, `mrossi01`…). Sceglilo semplice: lo useranno i tuoi compagni e il docente.
3. Conferma l'email cliccando il link che GitHub ti manda.

> 💡 Usa un'email che controlli davvero: ti servirà più avanti.

---

## 2. Comunica il tuo username al docente

Il repository del corso è **condiviso**: per poterci scrivere devi essere aggiunto come "collaboratore". Il docente può farlo solo se conosce il tuo **username** GitHub.

- Lo trovi in alto a destra su GitHub cliccando sull'icona del profilo: è il nome dopo la `@`.
- **Mandalo al docente** con il canale indicato a lezione (email/chat del corso).

> ⚠️ Finché non fai questo passo e il docente non ti invita, **il push (invio del codice) fallirà**. È il motivo n.1 di "a me non funziona".

---

## 3. Installa Git

### 🪟 Windows

1. Vai su **https://git-scm.com/download/win** — il download parte da solo (scegli "64-bit Git for Windows Setup").
2. Apri il file scaricato e clicca **Next / Avanti a ogni schermata**: le impostazioni predefinite vanno benissimo.
   - Una schermata chiede l'editor predefinito: se compare, scegli **"Use Visual Studio Code as Git's default editor"** (se hai già installato VS Code — vedi punto 5). Se non c'è VS Code, lascia pure il default: lo sistemiamo al punto 6.
   - Lascia attiva l'opzione **"Git Credential Manager"** (è già selezionata di default): serve per il login a GitHub.
3. Alla fine clicca **Install** e poi **Finish**.

**Verifica:** apri il menu Start, scrivi **`Git Bash`** e aprilo. Nella finestra nera scrivi:

```
git --version
```

Se compare qualcosa tipo `git version 2.xx.x`, ✅ è installato.

> 💡 Su Windows userai **Git Bash** (installato insieme a Git) come "terminale". Cercalo nel menu Start ogni volta che ti serve.

### 🐧 Linux

Apri il terminale e digita, secondo la tua distribuzione:

- **Ubuntu / Debian / Mint:**
  ```
  sudo apt update && sudo apt install git
  ```
- **Fedora:**
  ```
  sudo dnf install git
  ```

**Verifica:**

```
git --version
```

Se compare `git version 2.xx.x`, ✅ è installato.

---

## 4. Installa gli editor: VS Code e Antigravity

Nel corso useremo **due strumenti**. Entrambi hanno il pannello **Source Control** con cui, a lezione, potremo gestire commit e conflitti in modo visuale.

### 4a. Visual Studio Code (editor principale)

È l'editor "di base"; sarà anche l'editor di Git (lo impostiamo al punto 6).

- **🪟 Windows:** scarica da **https://code.visualstudio.com** → apri il file → Next/Install (default ok).
- **🐧 Linux:** scarica il pacchetto `.deb`/`.rpm` da **https://code.visualstudio.com** e installalo, oppure (Ubuntu) `sudo snap install code --classic`.

Apri VS Code almeno una volta per verificare che parta.

### 4b. Antigravity (IDE con AI)

È l'IDE di Google (costruito su VS Code) che useremo per la parte di sviluppo assistito dall'AI. Per accedere serve un **account Google**.

- **🪟 Windows:** scarica il file `.exe` da **https://antigravity.google/download** → aprilo. Se compare l'avviso **Windows Defender SmartScreen**, clicca **"Ulteriori informazioni" → "Esegui comunque"**, poi segui l'installazione (default ok).
- **🐧 Linux:** scarica il pacchetto `.deb` (Debian/Ubuntu) o `.tar.gz` da **https://antigravity.google/download** e installalo, es. `sudo dpkg -i antigravity-*.deb`.

Al **primo avvio**, accedi con il tuo **account Google** quando richiesto, e attendi che prepari l'ambiente.

> 💡 Requisiti: Windows 10/11 a 64 bit; su Linux una distribuzione recente (glibc ≥ 2.28). Antigravity è gratuito.

---

## 5. Configura Git (nome, email, editor)

Git deve sapere **chi sei** (comparirà accanto a ogni tua modifica) e quale **editor** usare.
Apri il terminale (**Git Bash** su Windows) e incolla questi comandi, **uno alla volta**, sostituendo i tuoi dati:

```
git config --global user.name "Mario Rossi"
git config --global user.email "la-tua-email@esempio.com"
git config --global core.editor "code --wait"
```

> ⚠️ Nella riga `user.email` usa **la stessa email dell'account GitHub**: così le tue modifiche risulteranno collegate al tuo profilo.

**Verifica:**

```
git config --global --list
```

Devono comparire le tre righe che hai appena impostato.

---

## 6. Imposta l'autenticazione a GitHub

Serve per farti riconoscere quando **invii** il tuo lavoro (`git push`). **Non useremo password**: il login avviene via browser.

### 🪟 Windows — niente da fare adesso

Git Credential Manager è già installato con Git. La **prima volta** che farai `git push` (a lezione), si aprirà una finestra del browser: clicca **"Sign in with your browser"**, accedi a GitHub e autorizza. Fatto una volta, non te lo chiede più.

### 🐧 Linux — installa GitHub CLI e fai login

Su Linux il modo più semplice è usare lo strumento ufficiale **GitHub CLI**:

1. Installa `gh`:
   - **Ubuntu/Debian:** `sudo apt update && sudo apt install gh`
   - **Fedora:** `sudo dnf install gh`
2. Esegui:
   ```
   gh auth login
   ```
   e rispondi così quando te lo chiede:
   - *What account do you want to log into?* → **GitHub.com**
   - *Preferred protocol for Git operations?* → **HTTPS**
   - *Authenticate Git with your GitHub credentials?* → **Yes**
   - *How would you like to authenticate?* → **Login with a web browser** → copia il codice, apri il link, incollalo, autorizza.

Questo configura automaticamente il login per il `git push`.

---

## 7. Accetta l'invito e clona il repository (test finale)

1. **Accetta l'invito:** dopo che hai mandato l'username (punto 2) e il docente ti ha invitato, ricevi un'email da GitHub (**"...invited you to collaborate"**) — oppure la trovi su **https://github.com/notifications**. Clicca **Accept invitation**.
2. **Scegli una cartella** dove tenere il progetto (es. `Documenti`). Aprila, poi apri lì il terminale:
   - **🪟 Windows:** dentro la cartella, tasto destro → **"Open Git Bash here"** (oppure apri Git Bash e spostati con `cd`).
   - **🐧 Linux:** tasto destro → "Apri nel terminale".
3. **Clona** (scarica) il repository con questo comando:
   ```
   git clone https://github.com/gxb1t/novify-api.git
   ```
4. **Verifica:** entra nella cartella appena creata e guarda cosa c'è dentro:
   ```
   cd novify-api
   git status
   ```
   Se vedi `On branch main` e `nothing to commit, working tree clean`, ✅ **hai finito il setup!**

> 💡 Il *push* (invio delle tue modifiche) lo proveremo insieme a lezione: è lì che comparirà il login del browser (Windows) — è normale, non è un errore.

---

## Problemi comuni

| Messaggio / sintomo | Cosa significa | Come risolvere |
|---|---|---|
| `git: command not found` / `'git' non è riconosciuto` | Git non è installato o il terminale è quello sbagliato | Ripeti il **punto 3**. Su Windows usa **Git Bash**, non il Prompt dei comandi. Chiudi e riapri il terminale dopo l'installazione. |
| `code: command not found` (dopo il punto 5) | VS Code non è nel PATH | Apri VS Code → `Ctrl+Shift+P` → digita *"Shell Command: Install 'code' command in PATH"* → invio. Poi riprova. |
| `Permission denied` o errore **403** al push | Non sei stato aggiunto come collaboratore, o hai fatto login con l'account sbagliato | Controlla di aver fatto i **punti 2 e 3** (invito accettato) e di esserti loggato con **il tuo** account GitHub. |
| `Support for password authentication was removed` | Stai provando a usare la password | Non serve la password: usa il **login via browser** (Windows) o **`gh auth login`** (Linux), punto 6. |
| Il browser del login non si apre (Windows) | A volte la finestra resta dietro | Guarda nella barra delle applicazioni; se proprio non compare, copia il link che appare nel terminale e aprilo a mano. |
| `fatal: repository not found` al clone | URL scritto male | Ricontrolla l'URL: `https://github.com/gxb1t/novify-api.git` |

---

### In sintesi
Se hai spuntato tutti gli 8 punti della checklist e il **test finale** (punto 7) è andato a buon fine, **sei pronto**. Alla lezione partiamo direttamente a lavorare, senza perdere tempo con l'installazione. 🚀
