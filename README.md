# Novify — progetto del corso

Sistema web distribuito a moduli comunicanti via REST API.
Corso **Blockchain Specialist** · II anno · Architetture IT e Blockchain · A.S. 2025/26

Questo è il repository condiviso del corso. Ci lavoriamo tutti insieme, un branch per persona, con `main` protetto. È la base su cui continueremo a lavorare: cresce insieme al progetto.

---

## Regole del repo (leggere prima di iniziare)

1. **Niente push diretto su `main`.** Il branch è protetto: ci si arriva solo con una Pull Request **approvata da un'altra persona**. Nessuno fa merge del proprio lavoro da solo — è la regola, non una cortesia.
2. **Un task = un branch.** Per questo esercizio ognuno crea il proprio branch:
   ```
   git switch -c nome-cognome
   ```
   Più avanti useremo nomi parlanti per i task veri, es. `feature/endpoint-brani`.
3. **Messaggi di commit brevi e all'imperativo**, es. `aggiungi endpoint GET brani`, `correggi validazione playlist`.
4. **Mai committare segreti.** Le chiavi stanno in `.env` (che è nel `.gitignore`). Vedi `.env.example`.

## Il flusso di squadra

```
git pull            # parti sempre da main aggiornato
git switch -c nome-cognome
# ...modifiche...
git add .
git commit -m "messaggio chiaro"
git push -u origin nome-cognome
# poi su GitHub: apri la Pull Request → review di un compagno → merge
```

## Esercizio

Tieni aperto il `GIT-CHEATSHEET.md`: ci sono tutti i comandi che servono.

L'esercizio è in **due giri**: prima si impara il flusso pulito, poi si affronta il conflitto.

### Giro 1 — la Pull Request

Ognuno ha **una riga assegnata** del backlog: in questo giro non ci sono conflitti.

1. `git pull` per partire da `main` aggiornato, poi `git switch -c nome-cognome`
2. In `BACKLOG.md` **prenota la tua riga**, scrivendo il tuo nome tra parentesi
3. `git add BACKLOG.md` → `git commit -m "prenota <task>"` → `git push -u origin nome-cognome`
4. Su GitHub apri la **Pull Request**, poi chiedi alla persona indicata in chat di **approvarla**
5. Merge

### Giro 2 — il conflitto

Adesso invece **tutti sulla stessa riga**, di proposito. Si parte tutti insieme, al via del docente.

1. `git switch main` → `git pull` → `git switch -c nome-cognome-2`
2. In cima a `BACKLOG.md` c'è `PRIORITÀ DI OGGI: ___`. Riscrivila col tuo task, poi commit, push e apri la PR
3. Il docente ne fa entrare **una sola**. Da quel momento le altre trovano il **conflitto**: è previsto
4. `git pull origin main` — Git segna il file con `<<<<<<<` `=======` `>>>>>>>`. Apri, scegli la riga da tenere, **cancella i marcatori**
5. `git add BACKLOG.md` → `git commit` → `git push`

> ⚠️ Nel giro 2 tocca **solo** la riga `PRIORITÀ`. Le prenotazioni del giro 1, più in basso, non c'entrano: lasciale stare.

> In alternativa al terminale potete usare il pannello **Source Control** di VS Code / Antigravity: sono gli stessi passi con un click.

## Il dominio: app di musica in streaming

Il contratto delle API è già stato progettato. Le risorse principali:

| Risorsa | Descrizione |
|---------|-------------|
| `Track` (brano) | id, titolo, artista, genere, durata |
| `Playlist` | id, nome, elenco di brani |

Endpoint di riferimento del contratto già progettato: `GET /api/v1/tracks`, `GET /api/v1/tracks/{id}`, `POST /api/v1/tracks`, `GET /api/v1/playlists`, ecc.

## Materiale utile

- `GIT-CHEATSHEET.md` — i comandi Git essenziali, gli stessi delle slide
- `.env.example` — come impostare le chiavi senza committarle
- Deck della lezione su Git e GitHub (Canva, cartella 2° anno)
