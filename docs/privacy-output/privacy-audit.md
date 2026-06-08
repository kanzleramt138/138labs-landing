# Privacy Audit: 138labs.de

Stand: 2026-06-08

Hinweis: Dies ist eine technische und inhaltliche Voranalyse fuer eine Datenschutzerklaerung. Sie ersetzt keine anwaltliche Pruefung. Fehlende oder nicht sicher belegbare Angaben sind als offen markiert.

## Pruefgrundlage

Geprueftes Archiv:

```text
/home/robert/uploads/138labs-landing.zip
```

Entpackter Analysepfad:

```text
/tmp/138labs-privacy-audit/138labs-landing
```

Relevante Dateien:

- `index.html`
- `impressum.html`
- `assets/fonts/fonts.css`
- `Dockerfile`
- `README.md`
- `docs/content-roadmap.md`
- `docs/landing-page-concept.md`
- `docs/coolify-deployment-workflow.md`

Ergaenzend beruecksichtigte Infrastrukturinformationen aus der laufenden Umgebung:

- Produktion laeuft als statische Nginx-Site in Docker/Coolify.
- `138labs.de` und `www.138labs.de` werden ueber Traefik/Coolify bereitgestellt.
- Cloudflare Proxy ist fuer `138labs.de` in der Infra-Dokumentation als aktiviert dokumentiert.

## Kurzfazit

Die aktuelle Website ist technisch datensparsam. Es gibt keine erkennbare Formularverarbeitung, kein eingebundenes Analytics-Skript, kein Newsletter-System, keine Zahlungsanbieter, keine Login-Funktion und keine eingebetteten Medien von Dritten.

Datenschutzrelevant sind aktuell vor allem:

- Server-/Proxy-Logfiles beim Abruf der Website
- Cloudflare als vorgeschalteter Proxy/CDN-/Security-Dienst, sofern fuer `138labs.de` aktiv
- lokaler Browser-Speicher fuer die Sprachwahl (`localStorage`)
- E-Mail-Kontakt ueber `mailto:robert@138labs.de`
- externe Links zu LinkedIn und GitHub
- lokal gehostete Webfonts und lokale Bild-/Logo-Assets

## Technische Funde

### Statische Website

Fund:

- `Dockerfile` nutzt `nginx:alpine` und kopiert die Website nach `/usr/share/nginx/html`.
- Kein `package.json`, keine Framework-Laufzeit, keine serverseitige App-Logik im Repo gefunden.

Datenschutzrelevanz:

- Beim Abruf der Website werden technisch notwendige Zugriffsdaten verarbeitet.
- Die Nginx-Access-Logs sind im Repo auf ein minimiertes Format ohne IP-Adresse, Referrer, User-Agent und Query-String umgestellt.
- Die Docker-Containerlogs werden groessenbasiert rotiert; eine feste zeitliche Retention ist nicht definiert.

### Lokale Assets und Fonts

Fund:

- `index.html` bindet `assets/fonts/fonts.css` ein.
- `fonts.css` referenziert lokale `.woff2`-Dateien.
- Logos und Bilder liegen lokal im Repo.

Bewertung:

- Keine externen Font-CDNs wie Google Fonts im aktiven Code gefunden.
- Keine Drittlanduebermittlung allein durch Font-Einbindung erkennbar.

### Sprachwahl per localStorage

Fund:

- `index.html` speichert die gewaehlte Sprache unter `138labs-language` in `window.localStorage`.
- Der Wert ist funktional fuer die Anzeige der Sprache.

Bewertung:

- Kein Cookie, aber browserseitige Speicherung.
- Voraussichtlich ein technisch/funktional erforderlicher bzw. nutzergewuenschter Komfortspeicher.
- Sollte transparent in der Datenschutzerklaerung genannt werden.
- Eine Cookie-Einwilligung ist nach aktuellem Code fuer diesen Punkt wahrscheinlich nicht erforderlich, sollte aber rechtlich final geprueft werden.

### Kontaktaufnahme

Fund:

- Kontakt erfolgt ueber `mailto:robert@138labs.de`.
- Kein Kontaktformular, keine direkte Website-Uebermittlung an einen Backend-Endpunkt gefunden.
- Impressum enthaelt E-Mail-Adresse und Telefonnummer.

Bewertung:

- Personenbezogene Daten entstehen bei Kontaktaufnahme per E-Mail oder Telefon ausserhalb der statischen Website.
- Typische Daten: Name, E-Mail-Adresse, Telefonnummer, Kommunikationsinhalte, Metadaten der Kommunikation.
- Speicherdauer und Mailanbieter sind offen.

### Externe Links

Fund:

- LinkedIn-Profil: `https://de.linkedin.com/in/robert-hormann-76a15621b`
- GitHub-Profil: `https://github.com/kanzleramt138`
- Externe Links haben `target="_blank"` und `rel="noopener noreferrer"`.

Bewertung:

- Beim reinen Seitenaufruf werden diese Dienste nicht geladen.
- Datenuebermittlung an LinkedIn/GitHub erfolgt erst beim aktiven Anklicken.
- Datenschutzerklaerung sollte darauf hinweisen, dass fuer die Verarbeitung auf den Zielseiten die jeweiligen Anbieter verantwortlich sind.

### Tracking, Cookies, Consent

Fund:

- Keine Analytics-Skripte gefunden.
- Keine `document.cookie`-Nutzung gefunden.
- Kein Consent-Management gefunden.
- Keine Pixel, Heatmaps, Sentry, PostHog, Matomo, Plausible, Google Analytics gefunden.

Bewertung:

- Aktuell keine Cookie-Banner-Pflicht aufgrund Tracking erkennbar.
- In `docs/content-roadmap.md` ist "add analytics and conversion tracking" als moeglicher spaeterer Punkt genannt. Das ist nicht implementiert und muss vor Umsetzung neu bewertet werden.

### Formulare, Login, Newsletter, Zahlungsanbieter

Fund:

- Keine Formulare im aktiven `index.html`.
- Keine Login-/Registrierungsfunktion.
- Kein Newsletter.
- Keine Zahlungsanbieter.

Bewertung:

- Pflichtabschnitte koennen in der Datenschutzerklaerung kurz als "nicht eingesetzt" beschrieben werden.

### KI-Dienste

Fund:

- Die Website bewirbt KI-Workshops, Automatisierungsanalyse und KI-Prototyping.
- Im aktiven Website-Code keine direkte Einbindung von OpenAI, ElevenLabs, n8n, Chatbots oder KI-APIs gefunden.

Bewertung:

- KI-Dienste sind auf der Website aktuell kein eigener technischer Verarbeitungsvorgang.
- Fuer Kundenprojekte und Prototypen sollte separat ein Datenschutz-/AVV-Prozess erstellt werden.

### Cloudflare

Fund:

- Aus der Infrastruktur-Dokumentation ist Cloudflare Proxy fuer `138labs.de` als aktiviert dokumentiert.
- Im Website-Code selbst gibt es keine Cloudflare-Skripte.

Bewertung:

- Wenn Cloudflare Proxy aktiv ist, verarbeitet Cloudflare beim Websiteabruf u. a. IP-Adressen, technische Request-Daten und Sicherheits-/Routingdaten.
- Cloudflare ist ein externer Dienstleister bzw. Auftragsverarbeiter, sofern entsprechend vertraglich eingebunden.
- Moegliche Drittlanduebermittlungen sind zu beruecksichtigen. Cloudflare stellt nach oeffentlichen Unterlagen ein DPA und SCCs bereit; konkrete Vertragslage muss geprueft werden.

## Identifizierte Verarbeitungstaetigkeiten

### 1. Bereitstellung der Website / Server-Logfiles

- Zweck: Auslieferung der Website, technische Stabilitaet, Sicherheit, Fehleranalyse.
- Datenkategorien im minimierten Nginx-Access-Log nach Deployment: Datum/Uhrzeit, HTTP-Methode, URI/Pfad ohne Query-String, Protokoll, Statuscode, uebertragene Datenmenge.
- Datenkategorien auf vorgelagerten Infrastruktur-Ebenen: IP-Adresse und technische Request-Daten koennen durch Traefik, Cloudflare oder Hostingbetrieb fuer Routing, TLS, Sicherheit und Missbrauchsschutz verarbeitet werden.
- Rechtsgrundlage: Art. 6 Abs. 1 lit. f DSGVO.
- Berechtigtes Interesse: sichere und stabile Bereitstellung der Website.
- Empfaenger: Server-/Hostingbetrieb, ggf. Coolify/Traefik/Nginx, ggf. Hostinganbieter.
- Drittlandtransfer: offen; abhaengig vom Hostinganbieter und Cloudflare-Nutzung.
- Speicherdauer: Docker-Containerlogs werden groessenbasiert rotiert (`max-size=10m`, `max-file=3`); Cloudflare-/Proxy-Retention offen.
- Pflicht zur Bereitstellung: technisch erforderlich fuer Websiteabruf.
- Profiling: nicht erkennbar.

### 2. Cloudflare Proxy/CDN/Security

- Zweck: DNS-/Proxy-Betrieb, Performance, TLS, Sicherheit, Schutz vor Missbrauch, Routing.
- Datenkategorien: IP-Adresse, technische Request-Daten, Header, Sicherheitsereignisse, ggf. Cookies/IDs von Cloudflare je nach Feature.
- Rechtsgrundlage: Art. 6 Abs. 1 lit. f DSGVO.
- Empfaenger: Cloudflare, Inc. / Cloudflare-Gruppe.
- Drittlandtransfer: moeglich, insbesondere USA; DPA/SCC/ggf. weitere Garantien pruefen.
- Speicherdauer: offen; Cloudflare-Einstellungen und Vertrag pruefen.
- Pflicht zur Bereitstellung: technisch erforderlich, wenn Cloudflare vorgeschaltet ist.
- Profiling: kein eigenes Profiling durch 138Labs erkennbar; Cloudflare-eigene Sicherheitsanalyse moeglich.

### 3. Sprachwahl im Browser

- Zweck: Speichern der bevorzugten Sprache.
- Datenkategorien: Sprachpraeferenz `de` oder `en` im `localStorage`-Eintrag `138labs-language`.
- Rechtsgrundlage: Art. 6 Abs. 1 lit. f DSGVO.
- Empfaenger: keine Uebermittlung an 138Labs erkennbar; Speicherung im Browser des Besuchers.
- Drittlandtransfer: keiner erkennbar.
- Speicherdauer: bis Loeschung durch Nutzer/Browsereinstellungen oder Ueberschreiben.
- Pflicht zur Bereitstellung: freiwillig; Website ist auch ohne Persistenz nutzbar.
- Profiling: nein.

### 4. Kontaktaufnahme per E-Mail oder Telefon

- Zweck: Bearbeitung von Anfragen, Erstgespraech, Geschaeftsanbahnung, Kommunikation.
- Datenkategorien: Name, E-Mail-Adresse, Telefonnummer, Organisation, Inhalt der Anfrage, Kommunikationsmetadaten; je nach Anfrage weitere freiwillig uebermittelte Informationen.
- Rechtsgrundlage: Art. 6 Abs. 1 lit. b DSGVO bei vorvertraglicher/vertraglicher Kommunikation; Art. 6 Abs. 1 lit. f DSGVO bei allgemeinen Anfragen.
- Empfaenger: 138Labs/Robert Hormann; E-Mail-/Telefonanbieter offen.
- Drittlandtransfer: offen; abhaengig vom E-Mail-/Telefonanbieter.
- Speicherdauer: offen; empfohlen: bis Abschluss der Anfrage, danach nach gesetzlichen Aufbewahrungspflichten oder berechtigtem Interesse.
- Pflicht zur Bereitstellung: freiwillig, aber fuer Bearbeitung der Anfrage erforderlich.
- Profiling: nein.

### 5. Externe Profile bei LinkedIn und GitHub

- Zweck: Verlinkung auf berufliche Profile und Quellcode-/Projektpraesenz.
- Datenkategorien: beim Klick koennen Zielanbieter IP-Adresse, Browserdaten, Referrer und ggf. Accountdaten verarbeiten.
- Rechtsgrundlage fuer Linksetzung: Art. 6 Abs. 1 lit. f DSGVO.
- Empfaenger: LinkedIn, GitHub nach aktivem Klick.
- Drittlandtransfer: moeglich, insbesondere USA.
- Speicherdauer: nach Datenschutzinformationen der Zielanbieter.
- Pflicht zur Bereitstellung: freiwillig.
- Profiling: durch Zielanbieter moeglich; nicht durch 138Labs steuerbar.

## Nicht im Code gefunden

- Kontaktformular
- Newsletter-Anmeldung
- Benutzerkonto / Registrierung
- Login-System
- Zahlungsanbieter
- Analytics / Tracking
- Social-Media-Widgets oder eingebettete Feeds
- YouTube/Vimeo/iFrames
- Externe Fonts/CDNs
- Chatbot oder KI-API direkt auf der Website

## Quellen

- DSGVO, insbesondere Art. 12, 13, 14: https://eur-lex.europa.eu/legal-content/DE/TXT/?uri=CELEX:32016R0679
- BfDI zu Informationspflichten: https://www.bfdi.bund.de/DE/Buerger/Inhalte/Allgemein/Datenschutz/Informationspflichten.html
- BfDI zu Betroffenenrechten: https://www.bfdi.bund.de/DE/Buerger/Basiswissen/Betroffenenrechte/BetroffenenRechte_node.html
- Cloudflare Data Processing Addendum: https://www.cloudflare.com/cloudflare-customer-dpa/
- Cloudflare SCC: https://www.cloudflare.com/cloudflare-customer-scc/
