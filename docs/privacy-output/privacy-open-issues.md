# Privacy Open Issues: 138labs.de

Stand: 2026-06-08

Diese Datei listet offene Angaben, rechtliche Unsicherheiten und empfohlene naechste Schritte fuer die Datenschutzerklaerung von `138labs.de`.

## Serverseitige Go/No-Go-Checkliste vor Veroeffentlichung

Diese Punkte sollten geklaert sein, bevor auf der Website eine Aussage wie "DSGVO-konform" verwendet wird.

### 1. Hosting und Serverbetrieb

- Hostinganbieter bzw. Serveranbieter ist benannt: Hetzner Online GmbH.
- Land/Rechenzentrum des Serverbetriebs ist benannt: Falkenstein, Deutschland.
- Auftragsverarbeitungsvertrag mit Hetzner wurde erstellt.
- Empfaenger, Drittlandtransfer und Speicherdauer sind in der Datenschutzerklaerung fuer den Serverbetrieb konkretisiert.

### 2. Nginx, Traefik, Coolify und Logfiles

- Nginx-Access-Logs sind im Repo auf ein minimiertes Format ohne IP-Adresse, Referrer, User-Agent und Query-String umgestellt.
- Traefik-Access-Logs sind nach aktuellem Server-Audit nicht explizit aktiviert.
- Docker-Logs werden groessenbasiert rotiert: `max-size=10m`, `max-file=3`.
- Offen bleibt eine echte zeitbasierte Log-Retention, zum Beispiel 7, 14 oder 30 Tage fuer normale Zugrifflogs.
- Laengere Speicherung nur fuer konkrete Sicherheitsvorfaelle oder Missbrauchsaufklaerung vorsehen.
- Debug-Logs sind nach aktuellem Server-Audit nicht erkennbar aktiv und sollten nicht dauerhaft aktiviert werden.
- Zugriff auf Logs auf notwendige Personen und Admin-Zugaenge beschraenken.
- Groessenbasierte automatische Rotation ist dokumentiert; zeitbasierte Loeschung waere bei Bedarf zusaetzlich technisch umzusetzen.

### 3. Cloudflare

- Cloudflare Proxy/CDN/Security fuer `138labs.de` ist produktiv aktiv.
- Cloudflare Data Processing Addendum wurde heruntergeladen und dokumentiert.
- Die SCC sind im Cloudflare-DPA enthalten bzw. dort ausdruecklich referenziert.
- Aktivierte Cloudflare-Features wurden technisch geprueft: Proxy/CDN, automatische DDoS-Schutzmechanismen, Cloudflare Managed Ruleset, Block AI Bots, Browser Integrity Check, Email Address Obfuscation, Challenge Passage.
- Nicht benoetigte Features deaktivieren.
- Cloudflare Security Analytics zeigt produktiv gesampelte Logs mit Zeit, Source IP, Host, Path und Action.

### 4. SSL-/TLS-Verschluesselung

- Sicherstellen, dass `https://138labs.de` und `https://www.138labs.de` ohne Zertifikatswarnung laden.
- Sicherstellen, dass kein Traefik-Default-Zertifikat ausgeliefert wird.
- HTTP dauerhaft auf HTTPS umleiten, sofern nicht bereits durch Cloudflare/Traefik erzwungen.
- Zertifikatserneuerung ueber Traefik/Coolify/Cloudflare pruefen.

### 5. Kontakt per E-Mail und Telefon

- E-Mail-Anbieter fuer `robert@138labs.de` benennen.
- Telefonanbieter bzw. Kommunikationsdienstleister intern dokumentieren.
- Auftragsverarbeitungsvertraege bzw. Datenschutzhinweise der Anbieter pruefen.
- Speicherkonzept festgelegt: allgemeine Kontaktanfragen nach Abschluss grundsaetzlich innerhalb von 12 Monaten loeschen, sofern keine gesetzliche Pflicht oder laufende Geschaeftsbeziehung besteht.
- Verfahren fuer Loeschung oder Archivierung alter Anfragen intern organisatorisch umsetzen.

### 6. Datenminimierung und kuenftige Erweiterungen

- Keine unnoetigen personenbezogenen Daten in Logs speichern.
- Keine externen Fonts, Skripte oder eingebetteten Inhalte ohne erneute Datenschutzpruefung einbauen.
- Keine Analytics-, Conversion-, Newsletter-, Formular-, Buchungs- oder KI-Dienste einbauen, ohne Datenschutzerklaerung und ggf. Consent-Mechanismus vorher anzupassen.
- Lokale Assets und lokale Fonts beibehalten, soweit moeglich.
- Die Aussage "DSGVO-konform" erst verwenden, wenn die offenen Punkte in dieser Datei abgeschlossen oder vertretbar dokumentiert sind.

## Fehlende Angaben

### Hostinganbieter

Geklaert:

- Hostinganbieter bzw. Serveranbieter fuer `138labs.de`: Hetzner Online GmbH.
- Auftragsverarbeitungsvertrag mit Hetzner: erstellt.
- Serverstandort: Falkenstein, Deutschland.

Warum relevant:

- Empfaenger der Daten und moegliche Drittlanduebermittlungen muessen in der Datenschutzerklaerung korrekt benannt werden.

### Server- und Proxy-Logfiles

Offen:

- Cloudflare-Logs und aktivierte Cloudflare-Features muessen noch im Cloudflare-Dashboard geprueft werden.
- Eine feste zeitliche Aufbewahrungsfrist fuer Docker-/Nginx-Logs ist nicht definiert.
- Die tatsaechliche Dauer der Speicherung haengt wegen groessenbasierter Docker-Rotation vom Logvolumen ab.

Empfehlung:

- Nginx-Minimierung nach Deployment verifizieren.
- Falls eine feste Speicherdauer benoetigt wird, zeitbasierte Loeschung technisch umsetzen oder einen dokumentierten Betriebsprozess definieren.
- Cloudflare-Logging und Cloudflare-Analytics separat pruefen.

### Cloudflare-Konfiguration

Teilweise geklaert:

- Cloudflare Proxy fuer `138labs.de` ist produktiv aktiv.
- Die aktiven Cloudflare-Features wurden im Dashboard geprueft und dokumentiert.
- Das Cloudflare Data Processing Addendum wurde heruntergeladen und dokumentiert.
- Die SCC sind im Cloudflare-DPA enthalten bzw. dort referenziert.
- Offen bleibt, ob fuer diese konkrete Domain zusaetzliche Cloudflare-Cookies, IDs oder Retention-Einstellungen relevant sind.
- Offen bleibt die interne Dokumentation des praktisch genutzten Transfermechanismus.

Risiko:

- Cloudflare kann IP-Adressen und technische Request-Daten verarbeiten.
- Drittlanduebermittlungen in die USA sind moeglich.

Empfehlung:

- Nur notwendige Cloudflare-Features aktivieren.
- Cloudflare-spezifische Cookies/Features und Retention vor Livegang der Datenschutzerklaerung final pruefen.

### E-Mail- und Telefonanbieter

Offen:

- Welcher Anbieter verarbeitet E-Mails an `robert@138labs.de`?
- Welcher Anbieter verarbeitet Telefonkommunikation?
- Gibt es Auftragsverarbeitungsvertraege?
- Werden Daten ausserhalb der EU/des EWR verarbeitet?

Warum relevant:

- Bei Kontaktaufnahme entstehen personenbezogene Daten ausserhalb der Website.

### Datenschutzbeauftragter

Geklaert:

- Ein Datenschutzbeauftragter ist nicht benannt.
- Nach aktueller Selbsteinschaetzung besteht derzeit keine Pflicht zur Benennung.
- Diese Einschaetzung ist bei wesentlichen Aenderungen von Umfang, Art oder Organisation der Datenverarbeitung erneut zu pruefen.

## Rechtliche Unsicherheiten

### Rechtsgrundlage Cloudflare

Aktuelle Annahme:

- Art. 6 Abs. 1 lit. f DSGVO, berechtigtes Interesse an Sicherheit, Performance und Stabilitaet.

Zu pruefen:

- Ob alle aktivierten Cloudflare-Features tatsaechlich technisch erforderlich bzw. durch berechtigtes Interesse abgedeckt sind.
- Ob fuer einzelne Features eine Einwilligung erforderlich wird.

### localStorage fuer Sprachwahl

Aktuelle Annahme:

- Die Speicherung `138labs-language` ist funktional und nicht trackingbezogen.

Zu pruefen:

- Ob nach TTDSG/ePrivacy eine Einwilligung entbehrlich ist, weil die Speicherung vom Nutzer gewuenscht bzw. fuer die Funktion erforderlich ist.

### "DSGVO-konform" im Hero

Fund:

- Die Website verwendet sichtbar die Aussage "DSGVO-konform".

Risiko:

- Diese Aussage kann als Compliance-Versprechen verstanden werden.
- Sie sollte nur verwendet werden, wenn interne Prozesse, AV-Vertraege, KI-Dienstleister, Datenfluesse und Kundenprojektprozesse tatsaechlich belastbar geregelt sind.

Empfehlung:

- Aussage entweder absichern oder vorsichtiger formulieren, z. B. "Datenschutz von Anfang an mitgedacht".

## Moeglicherweise fehlende Cookie-Einwilligungen

Aktueller Code-Stand:

- Kein Analytics.
- Keine Marketing-Pixel.
- Keine eingebetteten Drittmedien.
- Keine erkennbare Cookie-Nutzung durch eigenen Code.
- `localStorage` nur fuer Sprachwahl.

Derzeit wahrscheinlich keine Consent-Plattform erforderlich.

Aber:

- Wenn Cloudflare Features Cookies setzen, muss dies separat bewertet werden.
- Wenn spaeter Analytics oder Conversion Tracking eingefuehrt wird, ist voraussichtlich eine Einwilligungsloesung erforderlich.

## Moegliche Drittlandtransfers

### Cloudflare

Moeglich, insbesondere USA.

Zu pruefen:

- DPA
- Standardvertragsklauseln
- Data Privacy Framework oder andere Garantien
- aktivierte Cloudflare-Region-/Data-Localization-Optionen

### LinkedIn

Erst bei Klick auf externen Link.

Moeglich:

- USA und andere Drittlaender
- Profiling durch LinkedIn

### GitHub

Erst bei Klick auf externen Link.

Moeglich:

- USA und andere Drittlaender
- Verarbeitung nach GitHub-Datenschutzbedingungen

### E-Mail-/Telefonanbieter

Offen.

## Identifizierte DSGVO-Risiken

### Unklare Log-Speicherdauer

Risiko:

- Eine feste Tagesfrist kann nicht belastbar genannt werden, solange nur die groessenbasierte Docker-Rotation belegt ist.

Empfehlung:

- In der Datenschutzerklaerung die groessenbasierte Rotation nennen oder eine echte zeitbasierte Retention technisch umsetzen und dokumentieren.

### Cloudflare nicht voll dokumentiert

Risiko:

- Empfaenger, Drittlandtransfer und Speicherdauer koennen ohne Cloudflare-Kontopruefung nicht final angegeben werden.

Empfehlung:

- Cloudflare-Konfiguration und DPA pruefen.

### Spaetere Analytics-Implementierung

Fund:

- `docs/content-roadmap.md` nennt "add analytics and conversion tracking" als Future V2.

Risiko:

- Analytics wird spaeter eingebaut, ohne Datenschutzerklaerung und Consent-Mechanismus anzupassen.

Empfehlung:

- Vor Analytics-Einfuehrung Datenschutz-Folgen pruefen.
- Datensparsame Alternative bevorzugen.
- Consent-Management nur einfuehren, wenn wirklich erforderlich.

### Kontakt per E-Mail ohne Speicherkonzept

Risiko:

- Anfragen koennen dauerhaft im Postfach bleiben.

Empfehlung:

- Aufbewahrungsregel fuer Anfragen definieren.
- Projekt-/Vertragskommunikation getrennt von allgemeinen Anfragen behandeln.

### KI-Dienstleistungen ausserhalb der Website

Risiko:

- Die Website selbst bindet keine KI-Dienste ein, aber 138Labs bietet KI-Prototyping an.
- In Kundenprojekten koennen personenbezogene Daten, Drittanbieter-APIs und Drittlandtransfers relevant werden.

Empfehlung:

- Fuer Kundenprojekte eigene AVV-/Datenfluss-Pruefung aufsetzen.
- Vor Verarbeitung echter Kundendaten klaeren:
  - Welche Daten werden genutzt?
  - Welche KI-Anbieter werden eingesetzt?
  - Wo werden Daten verarbeitet?
  - Gibt es Training/Retention durch Anbieter?
  - Gibt es SCC/DPA?

## Empfehlungen zur Verbesserung der Compliance

1. Cloudflare-Logs, Retention und etwaige Cookies/IDs final pruefen.
2. IONOS-/Vodafone-Unterlagen und Speicherkonzept fuer Kontaktanfragen intern dokumentieren.
3. Nginx-Log-Minimierung nach Deployment verifizieren und Cloudflare-Logging pruefen.
4. Datenschutzerklaerung erst nach Ergaenzung der verbleibenden organisatorischen Angaben live stellen.
5. Footer-Link von `impressum.html#datenschutz` auf die finale Datenschutzseite aendern.
6. Aussage "DSGVO-konform" fachlich absichern oder vorsichtiger formulieren.
7. Vor Einfuehrung von Analytics, Kontaktformularen, Buchungstools oder Newslettern eine neue Datenschutzpruefung durchfuehren.
8. Fuer KI-Kundenprojekte eine separate Datenschutz-Checkliste und AVV-Vorlage erstellen.

## Technische To-dos fuer die Website

- Eigene Datenschutzseite anlegen, z. B. `datenschutz.html`.
- Footer-Link aktualisieren:

```html
<a href="datenschutz.html">Datenschutz</a>
```

- Optional: Abschnitt zur lokalen Sprachwahl in Datenschutzerklaerung leicht auffindbar machen.
- Optional: `robots.txt` und Security Header pruefen.

## Quellen

- DSGVO: https://eur-lex.europa.eu/legal-content/DE/TXT/?uri=CELEX:32016R0679
- BfDI Informationspflichten: https://www.bfdi.bund.de/DE/Buerger/Inhalte/Allgemein/Datenschutz/Informationspflichten.html
- BfDI Betroffenenrechte: https://www.bfdi.bund.de/DE/Buerger/Basiswissen/Betroffenenrechte/BetroffenenRechte_node.html
- Cloudflare DPA: https://www.cloudflare.com/cloudflare-customer-dpa/
- Cloudflare SCC: https://www.cloudflare.com/cloudflare-customer-scc/
