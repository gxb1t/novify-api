# Backlog — Novify API

> **PRIORITÀ DI OGGI:** ______________________

<!--
  ↑ Questa riga serve al GIRO 2 dell'esercizio.
  La riscrivete tutti, ognuno sul proprio branch: è lì che nascerà il conflitto,
  ed è voluto. Quando lo risolvete, toccate SOLO questa riga.
-->

---

## Come si usa questo file

Qui sotto ci sono le funzionalità previste dal contratto dell'API di Novify: quello
che il progetto dovrà saper fare.

Per l'esercizio di oggi **non si scrive codice**. Si prenota un task scrivendo il proprio
nome tra parentesi, poi si apre la Pull Request. L'obiettivo è provare il ciclo
completo — commit, push, PR, review, conflitto — non l'implementazione.

Ognuno ha **una riga assegnata**, che il docente pubblica in chat all'inizio del giro 1.
Nel giro 1 si tocca solo la propria: così non ci sono conflitti e il flusso si impara
pulito.

## I task

 1. [ ] `GET /api/v1/tracks` — lista dei brani ( )
 2. [ ] `GET /api/v1/tracks/{id}` — dettaglio di un brano ( )
 3. [ ] `POST /api/v1/tracks` — crea un nuovo brano ( )
 4. [ ] `GET /api/v1/playlists` — lista delle playlist ( )
 5. [ ] `GET /api/v1/playlists/{id}` — dettaglio di una playlist ( )
 6. [ ] `POST /api/v1/playlists` — crea una nuova playlist ( )
 7. [ ] `PUT /api/v1/playlists/{id}` — aggiungi un brano a una playlist ( )
 8. [ ] `GET /api/v1/tracks?genere=...` — ricerca brani per genere ( )
 9. [ ] `DELETE /api/v1/tracks/{id}` — elimina un brano ( )
10. [ ] `DELETE /api/v1/playlists/{id}` — elimina una playlist ( )
11. [ ] `GET /api/v1/artists` — lista degli artisti ( )
12. [ ] `GET /api/v1/artists/{id}/tracks` — i brani di un artista ( )
13. [ ] `GET /api/v1/playlists/{id}/tracks` — i brani di una playlist ( )
14. [ ] `DELETE /api/v1/playlists/{id}/tracks/{trackId}` — togli un brano da una playlist ( )
15. [ ] `GET /api/v1/tracks?durata_max=...` — ricerca brani per durata ( )
16. [ ] `GET /api/v1/genres` — elenco dei generi disponibili ( )
