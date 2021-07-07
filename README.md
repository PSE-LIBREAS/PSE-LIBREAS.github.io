# PSE-LIBREAS
## Technik Team Dokumentation

### Veränderungen im Repo/Ablauf

#### Jekyll auf Version 4.2.0 aktualisiert

Wir haben das Repo von Grund auf neu mit einer Jekyll-Instanz aufgesetzt. Hierzu haben wir im Gemfile Jekyll in der aktuellen Version 4.2.0 (Stand: 07.07.21) eingebunden. Anschließend haben wir über eine lokale Kopie des Repos auf der Kommandozeile `bundle update` laufen lassen (ggf. vorher den `Gemfile.lock` lokal löschen) und das aktualisierte Ergebnis (`Gemfile` und `Gemfile.lock`) auf das remote Repo gepusht. 

#### Jekyll-Scholar in Version 7.0.0 eingebunden

Um die Bibliographie für DLDL auf der Website einzubinden, haben wir uns dazu entschieden das Jekyll-Plugin `jekyll-scholar` zu verwenden. Dieses haben wir im `Gemfile` in der plugins section in der aktuellen Version 7.0.0 (Stand: 07.07.21) eingebunden. Zusätzlich habe wir alle plugins aus dem Gemfile in der `_config.yml` eingebunden und speziell für `jekyll-scholar` verschiedene Einstellungen (citation style, ordering, etc.) deklariert. 
 
### Ablauf der Veröffentlichung
1. Inhalte vorbereiten wie gehabt (als md oder html – yaml header muss in jedem Fall enthalten sein)
2. file structure beachten (ordner entsprechend der Verlinkungen)
3. GitHub Action ausführen
4. Regelmäßige Update-Routine (Jekyll, Gems, Dependencies)

### To-Do's
1. Layout ist noch nicht vollständig (icons, bold headings, etc.) --> muss noch entsprechend fertiggestellt werden
2. Inhalte müssen importiert werden
3. plugins müssen überprüft/ergänzt werden
4. evtl. DOIs in Bibliographie als klickbare Links setzen (wird aktuell noch nicht richtig dargestellt)
