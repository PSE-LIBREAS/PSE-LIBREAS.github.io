# PSE-LIBREAS – Digitale Wissenschafts- und Fachkommunikation (Projektseminar)

## Dokumentation (Technik Team)

### Veränderungen im Repo/Ablauf

#### Jekyll auf Version 4.2.0 aktualisiert

Wir haben das Repo von Grund auf neu mit einer Jekyll-Instanz aufgesetzt. Hierzu haben wir im Gemfile Jekyll in der aktuellen Version 4.2.0 (Stand: 07.07.21) eingebunden. Anschließend haben wir über eine lokale Kopie des Repos auf der Kommandozeile `bundle update` laufen lassen (ggf. vorher den `Gemfile.lock` lokal löschen) und das aktualisierte Ergebnis (`Gemfile` und `Gemfile.lock`) auf das remote Repo gepusht. Die Notwendigkeit des lokalen Updates mit bundle könnte auch daran gelegen haben, dass wir zunächst eine andere Version von Jekyll genutzt hatten. Für zukünftige Update-Prozesse könnte dieser Schritt jedoch auch notwendig sein.

#### Jekyll-Scholar in Version 7.0.0 eingebunden und konfiguriert

Um die Bibliographie für DLDL auf der Website einzubinden, haben wir uns dazu entschieden das Jekyll-Plugin `jekyll-scholar` zu verwenden. Dieses haben wir im `Gemfile` in der plugins section in der aktuellen Version 7.0.0 (Stand: 07.07.21) eingebunden. Zusätzlich habe wir alle plugins aus dem Gemfile in der `_config.yml` eingebunden und speziell für `jekyll-scholar` verschiedene Einstellungen (citation style, ordering, etc.) deklariert. 
Die Bibliographie liegt im BibTeX-Format im Ordner `_bibliography` und muss im einfachsten Fall nur erweitert werden. Die Einträge werden letztlich den Definitionen für jekyll-scholar in der `_config.yml` entsprechend sortiert und gruppiert. Für die korrekte Darstellung von URLs und DOIs als klickbare Links, haben wir externen Code nachgenutzt. Dieser liegt im `_plugins` Ordner in der `jekyll-scholar.rb` Datei. Die Funktionalitäten sind in der `_config.yml` über die `bibtex_filters` eingebunden. Der Code für die korrekte Verlinkung von DOIs führte bei allen Tests jedoch zu einer falschen html-Einbindung, weshalb in den `bibtex_filters` jetzt lediglich der `htmllinks`-Filter eingebunden ist und der `doilinks`-Filter entfernt wurde. Als quick-fix wurde in den bereits vorhandenen BibTeX-Einträgen das jeweilige `doi`-Feld entfernt und die DOI als URL im `url`-Feld hinterlegt.

#### Neue Ordnerstruktur

Um die Übersichtlichkeit zu verbessern, haben wir entschieden, dass alte Ausgaben der LIBREAS als Unterordner in einem Archiv-Ordner liegen sollen. Die aktuelle Ausgabe liegt in einem Ordner `aktuelle_ausgabe` für jedes Item in der Navigation (nav-bar), das kein externer Link ist, existiert ein Unterordner.

#### Veränderungen an der Website

Wir haben einen DLDL Bibliographie Reiter in die Navigation aufgenommen.

### Aufsetzen einer GitHub Action



### Ablauf der Veröffentlichung
1. Inhalte vorbereiten wie gehabt (als md oder html – yaml header muss in jedem Fall enthalten sein)
2. file structure beachten (ordner entsprechend der Verlinkungen)
3. GitHub Action ausführen
4. Regelmäßige Update-Routine (Jekyll, Gems, Dependencies)

### To-Do's
1. Layout ist noch nicht vollständig (icons, bold headings, etc.) --> muss noch entsprechend fertiggestellt werden
2. Inhalte müssen importiert werden
3. plugins müssen überprüft/ergänzt werden
4. ggf. DOIs in Bibliographie als klickbare Links setzen (wird aktuell nur über einen quick-fix erreicht)
5. Der Footer muss aktualisiert/angepasst werden
