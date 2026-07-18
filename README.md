# Novify — progetto del corso

Sistema web distribuito a moduli comunicanti via REST API.
Corso **Blockchain Specialist** · II anno · Architetture IT e Blockchain · A.S. 2025/26

Questo è il repository condiviso del corso. Ci lavoriamo tutti insieme, un branch per persona, con `main` protetto. È la base che cresce lezione dopo lezione: si parte dai mock delle API, poi arriva l'implementazione vera del backend, fino a un componente finale che scopriremo strada facendo.

---

## Regole del repo (leggere prima di iniziare)

1. **Niente push diretto su `main`.** Il branch è protetto: ci si arriva solo con una Pull Request approvata.
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

In coppia (esperto + meno esperto):

1. `git clone` di questo repo, poi `git switch -c nome-cognome`
2. Nel file `BACKLOG.md` **prenotate un task** scrivendo il vostro nome tra parentesi
3. `git add` / `commit` / `push` del vostro branch
4. Aprite una **Pull Request** su GitHub
5. Generate di proposito un **conflitto** modificando la stessa riga di un'altra coppia, poi risolvetelo insieme

> In alternativa al terminale potete usare il pannello **Source Control** di VS Code / Antigravity: sono gli stessi passi con un click.

## Il dominio: app di musica in streaming

Il contratto delle API è già stato progettato. Le risorse principali:

| Risorsa | Descrizione |
|---------|-------------|
| `Track` (brano) | id, titolo, artista, genere, durata |
| `Playlist` | id, nome, elenco di brani |

Endpoint di riferimento (implementati nei moduli successivi): `GET /api/v1/tracks`, `GET /api/v1/tracks/{id}`, `POST /api/v1/tracks`, `GET /api/v1/playlists`, ecc.

## Materiale utile

- `GIT-CHEATSHEET.md` — i comandi Git essenziali, gli stessi delle slide
- `.env.example` — come impostare le chiavi senza committarle
- Deck della lezione su Git e GitHub (Canva, cartella 2° anno)
