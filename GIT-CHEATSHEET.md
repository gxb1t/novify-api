# Git — comandi essenziali

Gli stessi comandi delle slide. Tienilo aperto durante l'esercizio.

## Iniziare

```
git clone <url>          # scarica il repo da GitHub sul tuo PC
git status               # cosa è cambiato e cosa è pronto per il commit
```

## Il ciclo quotidiano (locale)

```
git add <file>           # metti le modifiche nella staging area (il carrello)
git add .                # aggiungi tutto ciò che è cambiato
git commit -m "messaggio"  # registra lo snapshot (paghi alla cassa)
git diff                 # cosa è cambiato: leggilo PRIMA di add, mai committare alla cieca
```

## Lavorare col remoto (GitHub)

```
git pull                 # scarica e integra i commit degli altri — falla PRIMA di iniziare
git push                 # invia i tuoi commit al remoto — falla quando hai finito un pezzo
git fetch                # scarica le novità senza integrarle subito
```

Regola d'oro: **pull prima di iniziare, push quando hai finito.**

## Branch

```
git switch -c nome-cognome   # crea e passa a un nuovo branch
git switch main              # torna su main
git branch                   # elenca i branch
git push -u origin nome-cognome   # pubblica il tuo branch su GitHub (poi apri la PR)
```

## Consultare la storia

```
git log --oneline        # la catena dei commit, colpo d'occhio
git blame <file>         # per ogni riga, l'ultimo commit che l'ha toccata
```

## Conflitti (sono normali, non errori)

Quando due branch toccano le stesse righe, dopo un merge/pull Git segna il file così:

```
<<<<<<< HEAD
la tua versione
=======
la versione dell'altro
>>>>>>> altro-branch
```

Apri il file, scegli quale tenere (o combinale), **togli i marcatori** `<<<`, `===`, `>>>`, poi:

```
git add <file>
git commit          # conclude il merge
```

## Pull Request (su GitHub, non da terminale)

1. Push del tuo branch
2. Su GitHub compare "Compare & pull request" → aprila
3. Un compagno rivede, commenta, approva
4. **Merge** → il tuo lavoro entra in `main`

Niente push diretto su `main`: si passa sempre da una PR.
