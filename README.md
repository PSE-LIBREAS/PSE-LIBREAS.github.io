# PSE-LIBREAS – Digitale Wissenschafts- und Fachkommunikation (Projektseminar)

## Dokumentation (Technik Team)

### Veränderungen im Repo/Ablauf

#### Jekyll auf Version 4.2.0 aktualisiert

Wir haben das Repo von Grund auf neu mit einer Jekyll-Instanz aufgesetzt. Hierzu haben wir im Gemfile Jekyll in der aktuellen Version 4.2.0 (Stand: 07.07.21) eingebunden. Anschließend haben wir über eine lokale Kopie des Repos auf der Kommandozeile `bundle update` laufen lassen (ggf. vorher den `Gemfile.lock` lokal löschen) und das aktualisierte Ergebnis (`Gemfile` und `Gemfile.lock`) auf das remote Repo gepusht. Die Notwendigkeit des lokalen Updates mit `bundle` könnte auch daran gelegen haben, dass wir zunächst eine andere Version von Jekyll genutzt hatten. Für zukünftige Update-Prozesse könnte dieser Schritt jedoch auch notwendig sein.

#### Jekyll-Scholar in Version 7.0.0 eingebunden und konfiguriert

Um die Bibliographie für DLDL auf der Website einzubinden, haben wir uns dazu entschieden das Jekyll-Plugin `jekyll-scholar` zu verwenden. Dieses haben wir im `Gemfile` in der plugins section in der aktuellen Version 7.0.0 (Stand: 07.07.21) eingebunden. Zusätzlich haben wir alle plugins aus dem Gemfile in der `_config.yml` eingebunden und unter `scholar` verschiedene Einstellungen speziell für `jekyll-scholar` deklariert (citation style, ordering, etc.). 
Die Bibliographie liegt im `BibTeX` Format im Ordner `_bibliography` und muss im einfachsten Fall nur um neue Einträge erweitert/ergänzt werden. Die Einträge werden letztlich den Definitionen für jekyll-scholar in der `_config.yml` entsprechend sortiert und gruppiert. Für die korrekte Darstellung von URLs und DOIs als klickbare Links haben wir externen Code nachgenutzt. Dieser liegt im `_plugins` Ordner in der `jekyll-scholar.rb` Datei. Die Funktionalitäten sind in der `_config.yml` über die `bibtex_filters` eingebunden. Der Code für die korrekte Verlinkung von DOIs führte bei allen Tests jedoch zu einer falschen html-Einbindung, weshalb in den `bibtex_filters` jetzt lediglich der `htmllinks` Filter eingebunden ist und der `doilinks` Filter entfernt wurde. Als quick-fix wurde in den bereits vorhandenen BibTeX-Dummy-Einträgen das jeweilige `doi` Feld entfernt und die DOI im URL-Format im `url` Feld hinterlegt.

#### Neue Ordnerstruktur

Um die Übersichtlichkeit des Repos zu verbessern, haben wir entschieden die Ordnerstruktur ein wenig abzuändern. Wir haben einen Überordner `archiv` erstellt, in dem wir für alle alten Ausgaben der LIBREAS jeweils eigene Unterordner ablegen wollen. Der übergeordnete `archiv` Ordner enthält zusätzlich eine `index.md`, in der wir über Links im Markdown Format auf die jeweiligen Unterordner verweisen. Für die jeweils aktuelle Ausgabe der LIBREAS haben wir einen Ordner `aktuelle_ausgabe` erstellt, in dem dann ein Ordner für den content der aktuellen Ausgabe liegen soll. für jedes Item in der Navigation (nav-bar), das kein externer Link ist, existiert ein Unterordner.

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
