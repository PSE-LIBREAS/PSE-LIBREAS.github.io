# PSE-LIBREAS – Digitale Wissenschafts- und Fachkommunikation (Projektseminar)

## Dokumentation (Technik Team)

### Veränderungen im Vergleich zum LIBREAS-Repo

#### Jekyll auf Version 4.2.0 aktualisiert

Wir haben das Repo von Grund auf neu mit einer Jekyll-Instanz aufgesetzt. Hierzu haben wir im Gemfile Jekyll in der aktuellen Version 4.2.0 (Stand: 07.07.21) eingebunden. Anschließend haben wir über eine lokale Kopie des Repos auf der Kommandozeile `bundle update` laufen lassen (ggf. vorher den `Gemfile.lock` lokal löschen) und das aktualisierte Ergebnis (`Gemfile` und `Gemfile.lock`) auf das remote Repo gepusht. Die Notwendigkeit des lokalen Updates mit `bundle` könnte auch daran gelegen haben, dass wir zunächst eine andere Version von Jekyll genutzt hatten. Für zukünftige Update-Prozesse könnte dieser Schritt jedoch auch notwendig sein.

#### Jekyll-Scholar in Version 7.0.0 eingebunden und konfiguriert

Um die Bibliographie für DLDL auf der Website einzubinden, haben wir uns dazu entschieden – in Absprache mit dem LIBREAS Technik-Team – das Jekyll-Plugin `jekyll-scholar` zu verwenden. Dieses haben wir im `Gemfile` in der plugins section in der aktuellen Version 7.0.0 (Stand: 07.07.21) eingebunden. Zusätzlich haben wir alle plugins aus dem Gemfile in der `_config.yml` eingebunden und unter `scholar` verschiedene Einstellungen speziell für `jekyll-scholar` deklariert (citation style, ordering, etc.). 
Die Bibliographie liegt im `BibTeX` Format im Ordner `_bibliography` und muss im einfachsten Fall nur um neue Einträge erweitert/ergänzt werden. Die Einträge werden letztlich den Definitionen für jekyll-scholar in der `_config.yml` entsprechend sortiert und gruppiert. Für die korrekte Darstellung von URLs und DOIs als klickbare Links haben wir externen Code nachgenutzt. Dieser liegt im `_plugins` Ordner in der `jekyll-scholar.rb` Datei. Die Funktionalitäten sind in der `_config.yml` über die `bibtex_filters` eingebunden. Der Code für die korrekte Verlinkung von DOIs führte bei allen Tests jedoch zu einer falschen html-Einbindung, weshalb in den `bibtex_filters` jetzt lediglich der `htmllinks` Filter eingebunden ist und der `doilinks` Filter entfernt wurde. Als quick-fix wurde in den bereits vorhandenen BibTeX-Dummy-Einträgen das jeweilige `doi` Feld entfernt und die DOI im URL-Format im `url` Feld hinterlegt.

#### Neue Ordnerstruktur

Um die Übersichtlichkeit des Repos zu verbessern, haben wir entschieden die Ordnerstruktur ein wenig abzuändern. Wir haben einen Ordner `archiv` erstellt, in dem wir für alle alten Ausgaben der LIBREAS jeweils eigene Unterordner ablegen wollen. Der übergeordnete `archiv` Ordner enthält zusätzlich eine `index.md`, in der wir über Links im Markdown Format auf die jeweiligen Unterordner verweisen. Für die jeweils aktuelle Ausgabe der LIBREAS haben wir einen Ordner `aktuelle_ausgabe` erstellt, in dem dann ein Ordner für den content der aktuellen Ausgabe liegen soll. Die `about.md`, die zuvor im root Verzeichnis des Repos lag, haben wir in einen neu erstellten `about` Ordner verschoben und zu `index.md` umbenannt. Wir wollten damit erreichen, dass für jeden Reiter in der Seitenleiste (nav-bar), hinter dem kein externer Link liegt, ein eigener (Unter-)Ordner existiert und somit nur die `index.md` der Startseite sowie die `404.html` (plain) unter root liegen. Im LIBREAS-Repo bereits existierende Ordner wurden dabei weitesgehend übernommen (z.B. authorguides, autorinnen, bilder). Ebenso wurde das `lanyon` Theme und damit auch weitestgehend die Ordner `_includes` und `_layout` übernommen.

### Veränderungen an der Website

Wir haben einen DLDL Bibliographie Reiter in der Seitenleiste hinzugefügt. Dazu haben wir ein neues `sidebar-nav-item` in der `navigation.html`, die in `_includes/custom/` liegt, unterhalb des `AutorInnen` Reiters eingefügt und entsprechend auf unseren neu erstellten `dldlbibliography` Ordner verlinkt. Dieser Ordner enthält lediglich eine `index.hmtl` Datei, die die Bibliographie über `{% bibliography %}` einbindet.

### Aufsetzen einer GitHub Action

Um den build Prozess remote über GitHub laufen lassen zu können, haben wir uns dazu entschieden eine GitHub Action aufzusetzen. Die Action liegt unter `.github/worflows/` und kann dort bei Bedarf angepasst/verändert werden. Sie nutzt einen bestehenden [Prozess](https://github.com/joshlarsen/jekyll4-deploy-gh-pages) nach, wurde von uns jedoch insofern angepasst, dass wir aktuell ausschließlich einen manuellen Trigger definiert haben. Bei Bedarf könnte definiert werden, dass die Action jedes mal starten soll, wenn ein push auf den `main` Branch ausgeführt wird oder dass die Action in regelmäßigen Intervallen mittels cron job initiiert wird. Für unsere Zwecke war der manuelle Trigger die beste Lösung, da wir anfänglich viel herumprobiert haben und nicht bei jeder kleinen Veränderung die Action starten wollten. Wenn die Action läuft nimmt sie die source Dateien vom `main` Branch, baut die statischen html-Seiten und pusht das Ergebnis auf den `gh-pages` Branch. Vom `gh-pages` Branch aus wird anschließend die Seite über GitHub-Pages gerendert/veröffentlicht. Das Hinzufügen neuer Inhalte geschieht demnach nur auf dem `main` Branch. Der `gh-pages` Branch muss und sollte also nicht manuell verändert werden.

### Ablauf der Veröffentlichung
1. Inhalte vorbereiten wie gehabt (als md oder html – yaml header muss in jedem Fall enthalten sein, damit Jekyll die Seite ordentlich bauen kann)
2. Geänderte Ordnerstruktur beachten (Ordner entsprechend der Verlinkungen)
3. GitHub Action ausführen (manuell)
4. Regelmäßige Update-Routine (Jekyll, Gems, Dependencies)

### To-Do's
1. Layout ist noch nicht vollständig (icons, bold headings, etc.) --> muss noch entsprechend fertiggestellt werden
2. Inhalte müssen importiert werden
3. plugins müssen überprüft/ergänzt werden
4. ggf. DOIs in Bibliographie als klickbare Links setzen (wird aktuell nur über einen quick-fix erreicht)
5. Der Footer muss aktualisiert/angepasst werden
