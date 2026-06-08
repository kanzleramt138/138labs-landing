# Privacy Open Issues: 138labs.de

Stand: 2026-06-08

Diese Datei listet offene Angaben, rechtliche Unsicherheiten und empfohlene naechste Schritte fuer die Datenschutzerklaerung von `138labs.de`.

## Serverseitige Go/No-Go-Checkliste vor Veroeffentlichung

Diese Punkte sollten geklaert sein, bevor auf der Website eine Aussage wie "DSGVO-konform" verwendet wird.

### 1. Hosting und Serverbetrieb

- Hostinganbieter bzw. Serveranbieter eindeutig benennen.
- Land/Rechenzentrum des Serverbetriebs klaeren.
- Auftragsverarbeitungsvertrag mit dem Hostinganbieter pruefen bzw. abschliessen.
- Empfaenger, Drittlandtransfer und Speicherdauer in der Datenschutzerklaerung finalisieren.

### 2. Nginx, Traefik, Coolify und Logfiles

- Pruefen, ob Access-Logs in Nginx, Traefik und Coolify aktiv sind.
- Pruefen, welche Datenfelder gespeichert werden, insbesondere IP-Adresse, Zeitstempel, URL, User-Agent, Referrer und Statuscode.
- Feste Log-Retention definieren, zum Beispiel 7, 14 oder 30 Tage fuer normale Zugrifflogs.
- Laengere Speicherung nur fuer konkrete Sicherheitsvorfaelle oder Missbrauchsaufklaerung vorsehen.
- Debug-Logs nicht dauerhaft aktiv lassen.
- Zugriff auf Logs auf notwendige Personen und Admin-Zugaenge beschraenken.
- Automatische Rotation und Loeschung technisch einrichten oder dokumentieren.

### 3. Cloudflare

- Klaeren, ob Cloudflare Proxy/CDN/Security fuer `138labs.de` dauerhaft aktiv ist.
- Cloudflare Data Processing Addendum pruefen bzw. abschliessen.
- SCC bzw. Drittlandtransfermechanismus dokumentieren.
- Aktivierte Cloudflare-Features pruefen: CDN, WAF, Bot Fight Mode, Turnstile, Analytics, Logs, Zaraz.
- Nicht benoetigte Features deaktivieren.
- Pruefen, ob Cloudflare Cookies oder sonstige Identifikatoren fuer diese Domain setzt.
- Falls Cloudflare Cookies/IDs oder Analytics-Features aktiv sind, Einwilligungsbedarf gesondert pruefen.

### 4. SSL-/TLS-Verschluesselung

- Sicherstellen, dass `https://138labs.de` und `https://www.138labs.de` ohne Zertifikatswarnung laden.
- Sicherstellen, dass kein Traefik-Default-Zertifikat ausgeliefert wird.
- HTTP dauerhaft auf HTTPS umleiten, sofern nicht bereits durch Cloudflare/Traefik erzwungen.
- Zertifikatserneuerung ueber Traefik/Coolify/Cloudflare pruefen.

### 5. Kontakt per E-Mail und Telefon

- E-Mail-Anbieter fuer `robert@138labs.de` benennen.
- Telefonanbieter bzw. Kommunikationsdienstleister intern dokumentieren.
- Auftragsverarbeitungsvertraege bzw. Datenschutzhinweise der Anbieter pruefen.
- Speicherdauer fuer Kontaktanfragen festlegen, zum Beispiel bis Abschluss der Anfrage plus erforderliche handels-/steuerrechtliche Aufbewahrung.
- Verfahren fuer Loeschung oder Archivierung alter Anfragen definieren.

### 6. Datenminimierung und kuenftige Erweiterungen

- Keine unnoetigen personenbezogenen Daten in Logs speichern.
- Keine externen Fonts, Skripte oder eingebetteten Inhalte ohne erneute Datenschutzpruefung einbauen.
- Keine Analytics-, Conversion-, Newsletter-, Formular-, Buchungs- oder KI-Dienste einbauen, ohne Datenschutzerklaerung und ggf. Consent-Mechanismus vorher anzupassen.
- Lokale Assets und lokale Fonts beibehalten, soweit moeglich.
- Die Aussage "DSGVO-konform" erst verwenden, wenn die offenen Punkte in dieser Datei abgeschlossen oder vertretbar dokumentiert sind.

## Fehlende Angaben

### Hostinganbieter

Offen:

- Welcher konkrete Hostinganbieter bzw. Serveranbieter wird fuer `138labs.de` eingesetzt?
- Besteht ein Auftragsverarbeitungsvertrag mit dem Hostinganbieter?
- In welchem Land bzw. Rechenzentrum wird der Server betrieben?

Warum relevant:

- Empfaenger der Daten und moegliche Drittlanduebermittlungen muessen in der Datenschutzerklaerung korrekt benannt werden.

### Server- und Proxy-Logfiles

Offen:

- Welche Logs werden durch Nginx, Traefik, Coolify und ggf. Cloudflare tatsaechlich gespeichert?
- Welche konkreten Datenfelder werden gespeichert?
- Wie lange werden Logs aufbewahrt?
- Gibt es automatische Rotation oder Loeschung?

Empfehlung:

- Log-Konfiguration pruefen.
- Eine feste Speicherdauer definieren, zum Beispiel eine kurze Frist fuer normale Zugrifflogs und laengere Speicherung nur bei Sicherheitsvorfaellen.

### Cloudflare-Konfiguration

Offen:

- Ist Cloudflare Proxy fuer `138labs.de` produktiv dauerhaft aktiviert?
- Welche Cloudflare-Features sind aktiv? Beispiel: CDN, WAF, Bot Fight Mode, Turnstile, Analytics, Logs, Zaraz.
- Setzt Cloudflare fuer diese Domain Cookies oder andere Identifikatoren?
- Ist das Cloudflare Data Processing Addendum abgeschlossen?
- Welche Garantien werden fuer Drittlanduebermittlungen genutzt?

Risiko:

- Cloudflare kann IP-Adressen und technische Request-Daten verarbeiten.
- Drittlanduebermittlungen in die USA sind moeglich.

Empfehlung:

- Cloudflare-DPA und SCC/Transfermechanismus pruefen.
- Nur notwendige Cloudflare-Features aktivieren.
- Cloudflare-spezifische Cookies/Features vor Livegang der Datenschutzerklaerung pruefen.

### E-Mail- und Telefonanbieter

Offen:

- Welcher Anbieter verarbeitet E-Mails an `robert@138labs.de`?
- Welcher Anbieter verarbeitet Telefonkommunikation?
- Gibt es Auftragsverarbeitungsvertraege?
- Werden Daten ausserhalb der EU/des EWR verarbeitet?

Warum relevant:

- Bei Kontaktaufnahme entstehen personenbezogene Daten ausserhalb der Website.

### Datenschutzbeauftragter

Offen:

- Besteht eine Pflicht zur Benennung eines Datenschutzbeauftragten?
- Falls ja: Kontaktdaten ergaenzen.
- Falls nein: Formulierung in der Datenschutzerklaerung entsprechend finalisieren.

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

- Datenschutzerklaerung bleibt unvollstaendig, wenn keine Speicherdauer oder Kriterien genannt werden.

Empfehlung:

- Technische Log-Retention festlegen und dokumentieren.

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

1. Hostinganbieter und AVV final klaeren.
2. Cloudflare-DPA, SCC und aktivierte Features pruefen.
3. Log-Retention technisch festlegen und dokumentieren.
4. Datenschutzerklaerung erst nach Ergaenzung der offenen Anbieterangaben live stellen.
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
