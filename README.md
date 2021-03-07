# Simulazione in modelica sistema prenotaizone
Per il corso di ingegneria del software si richiedeva di modellare tramite Modelica tutti gli ambienti e gli attori di un sistema per la prenotaizone delle aule.

<h2>File contenuti nella cartella Models</h2>

<ul>
  <li> <i> aula.mo:</i> modella un'aula del sistema che può essere agibile o non agibile</li>
  <li> <i> studente.mo:</i> modella l'attore porincpale del sistema </li>
  <li> <i> gomp.mo:</i> sistema esterno che si occupa della gestione dei dati </li>
  <li> <i> prodigit.mo:</i> blocco principale che si occupa di svolgere tuttle le operazioni necessarie </li>
  <li> <i> funPrenota.mo:</i> permette di effettuare una prenotazione nell'aula </li>
  <li> <i> funCancella.mo:</i> permette di effettuare una cancellazione nell'aula </li>
  <li> <i> funMedia.mo:</i> calcola la media dei fallimenti del sistema Prodigit  </li>
  <li> <i> monitorFun:</i> verifica la violazione dei requisiti funzionali </li>
  <li> <i> monitorNotFun:</i> verifica la violazione del requisito non funzionale </li>
  <li> <i> system.mo:</i> file che si occupa di collegare gli input e gli output </li>
  <li> <i> run.mos:</i> file per eseguire una singola simulazione </li>
  <li> <i> verify.py:</i> file Python che controlla su un certo numero di interazioni il requisito funzionale </li>
  <li> <i> synth.py:</i> file Python che controlla su un certo numero di interazioni il requisito non funzionale </li> 
<ul>
  
<h2> Come eseguire il codice </h2>  
Il progetot è stato scritto con <a href="https://openmodelica.org/">OpenModelica 1.17</a> e Python 2.7 quindi non si assicura il funzionamento con verisoni differenti.
Per eseguire una singola iterazione con la stampa del grafico di output, spostarsi nella cartella Models e lanciare il comando <code>omc run.mos</code> e attendere la compilazione,se tutto è andato a buon fine verrà mostrato a schemro un grafico che mostra l'andamento delle varie variabili di sistema.<br>
Per cambiare le variabili da stampare modificare all'interno del file <i>run.mos</i> l'ultima riga inserendo il nome dell'oggetto (vedere il file <i>system.mo</i>) seguito dal nome della variabile d'interesse, separati da un "." .
Per eseguire il file più volte e verificare i requisiti eseguire <code>python verify.py</code> (per il requisito funzionale e  <code>python synt.py</code>, per quello non funzionale. <br>
Il numero di test è determinato dalla variabile *nTest*. Verranno quindi generati dei file di output con il risultato delle varie iterazioni.
