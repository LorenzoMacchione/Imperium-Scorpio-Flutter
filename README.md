## Introduzione

Benvenuto nel repository del nostro videogioco di carte multiplayer online creato con Flutter. Questa applicazione offre un'esperienza coinvolgente di gioco di carte online, sfruttando Flutter per una compatibilità cross-platform. Abbiamo utilizzato il linguaggio di programmazione Dart per implementare la logica di gioco e i widget per gestire l'interfaccia utente.

## Caratteristiche Principali

1. **Database delle Carte:** Al primo avvio dell'applicazione, viene creato un database locale contenente tutte le carte necessarie per il gioco. Questo database locale assicura un'esperienza di gioco fluida e reattiva.

2. **Firebase Realtime Database:** Per gestire le comunicazioni in tempo reale tra i giocatori, abbiamo integrato il Firebase Realtime Database. Questo consente un flusso continuo di dati tra i dispositivi, rendendo il gioco multiplayer possibile e coinvolgente.

3. **Lock per la Sicurezza:** Per garantire l'integrità dei dati e la sicurezza durante le transazioni, abbiamo implementato un sistema di Lock che gestisce l'accesso concorrente alle risorse del database. Questo assicura che le operazioni siano eseguite in modo sicuro e coerente.

## Installazione

L'applicazione può essere installata come test o generando un eseguibile, ma è importante notare che i server sono disattivati. Di conseguenza, non sarà possibile avviare una partita multiplayer. L'applicazione può comunque essere esplorata e testata localmente per esaminare la logica di gioco, le interfacce utente e l'interazione con il database.

## Requisiti di Sistema

- Flutter installato
- Connessione internet per l'installazione delle dipendenze e l'accesso al database Firebase

## Istruzioni per l'Utilizzo

# Apri con Flutter:
- Assicurati di avere Flutter installato.
- Naviga nella cartella del progetto.
- Esegui il comando `flutter pub get` per installare le dipendenze.
- Esegui l'applicazione con il comando `flutter run`.

# Configurazione Firebase:
- Configura il tuo progetto Firebase e ottieni il file di configurazione `google-services.json`.
- Colloca il file `google-services.json` nella directory `android/app` del progetto.

# Esplora l'applicazione:
- Esplora le diverse schermate dell'applicazione, sperimenta con le funzionalità e osserva la gestione dei dati in tempo reale tramite Firebase.
  
## Avvertenza Importante:

Attualmente, a causa della disattivazione dei server, la possibilità di avviare una partita multiplayer non è attiva. Inoltre, la modalità demo, che avrebbe permesso di esplorare la logica di gioco senza la connessione ai server, non è stata implementata a causa di restrizioni di tempo.

## Esplorazione del Codice Sorgente:

Invitiamo gli sviluppatori a esplorare il codice sorgente del gioco per comprendere la logica di gioco, la gestione delle carte e l'interazione con il database.

Grazie per la comprensione e per il tuo interesse nel nostro progetto. Se hai domande o suggerimenti, non esitare a contattarci.

# Buon lavoro!
