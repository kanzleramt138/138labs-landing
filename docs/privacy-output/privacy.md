# Datenschutzerklaerung

Stand: 2026-06-08

Diese Datenschutzerklaerung informiert darueber, wie personenbezogene Daten beim Besuch der Website `138labs.de` und bei der Kontaktaufnahme mit 138Labs verarbeitet werden. Sie orientiert sich an den Informationspflichten nach Art. 12, 13 und 14 DSGVO.

## 1. Verantwortlicher

Verantwortlich fuer die Datenverarbeitung ist:

Robert Hormann  
Oppenhoffallee 7  
52066 Aachen  
Deutschland

E-Mail: robert@138labs.de  
Telefon: +49 157 79226766

## 2. Datenschutzbeauftragter

Ein Datenschutzbeauftragter ist nicht benannt.

Nach aktueller Selbsteinschaetzung besteht fuer 138Labs derzeit keine Pflicht zur Benennung eines Datenschutzbeauftragten. Diese Einschaetzung ist erneut zu pruefen, wenn sich Umfang, Art oder Organisation der Datenverarbeitung wesentlich aendern, insbesondere bei regelmaessiger umfangreicher Verarbeitung personenbezogener Daten, besonderer Kategorien personenbezogener Daten oder bei wachsender Mitarbeiterzahl.

## 3. Allgemeine Hinweise

Wir verarbeiten personenbezogene Daten nur, soweit dies fuer den Betrieb dieser Website, die Bearbeitung von Anfragen, die Sicherheit unserer Systeme oder die Kommunikation mit Ihnen erforderlich ist.

Personenbezogene Daten sind alle Informationen, die sich auf eine identifizierte oder identifizierbare Person beziehen, zum Beispiel Name, E-Mail-Adresse, IP-Adresse oder Kommunikationsinhalte.

## 4. Hosting und Bereitstellung der Website

Diese Website wird als statische Website auf einem VPS bei Hetzner betrieben. Der Serverstandort ist nach aktueller Angabe Falkenstein, Deutschland. Die technische Bereitstellung erfolgt ueber Nginx, Docker/Coolify und Traefik.

Beim Aufruf der Website werden technisch notwendige Daten verarbeitet, damit die Website an Ihr Endgeraet ausgeliefert werden kann.

Zweck der Verarbeitung:

- Bereitstellung der Website
- Sicherstellung von Stabilitaet und Sicherheit
- Fehleranalyse
- Schutz vor Missbrauch

Kategorien personenbezogener Daten:

- Datum und Uhrzeit des Abrufs
- aufgerufener Pfad bzw. URI
- HTTP-Methode
- HTTP-Protokoll
- HTTP-Statuscode
- uebertragene Datenmenge

Die Nginx-Access-Logs der Website sind im Repo auf ein minimiertes Format ohne IP-Adresse, Referrer, User-Agent und Query-String konfiguriert. Diese minimierte Konfiguration wird nach Rebuild und Deployment des Coolify-Containers wirksam. Auf vorgelagerten technischen Ebenen, insbesondere bei Traefik, Cloudflare oder dem Hostingbetrieb, koennen IP-Adressen und technische Request-Daten weiterhin zur Auslieferung, Absicherung und Fehleranalyse verarbeitet werden.

Rechtsgrundlage:

Die Verarbeitung erfolgt auf Grundlage von Art. 6 Abs. 1 lit. f DSGVO. Unser berechtigtes Interesse liegt in der sicheren, stabilen und technisch fehlerfreien Bereitstellung der Website.

Empfaenger:

- interne technische Administration
- Hosting-/Serveranbieter: Hetzner Online GmbH
- eingesetzte Infrastrukturkomponenten wie Nginx, Traefik und Coolify

Drittlanduebermittlung:

Der Serverstandort liegt nach aktueller Angabe in Deutschland. Eine Drittlanduebermittlung durch den Serverbetrieb ist danach nicht ersichtlich. Eine Drittlanduebermittlung kann jedoch im Zusammenhang mit Cloudflare nicht ausgeschlossen werden.

Speicherdauer:

Container-Logs werden nach aktuellem technischen Stand groessenbasiert rotiert. Pro Docker-Container werden maximal drei Logdateien mit jeweils maximal 10 MB vorgehalten. Eine feste zeitliche Speicherdauer ist dadurch nicht garantiert. Logfiles sollten nur so lange gespeichert werden, wie dies fuer Sicherheit, Fehleranalyse und Missbrauchsaufklaerung erforderlich ist.

Pflicht zur Bereitstellung:

Die Verarbeitung dieser Daten ist technisch erforderlich, um die Website aufzurufen.

Automatisierte Entscheidungen / Profiling:

Eine automatisierte Entscheidungsfindung oder ein Profiling durch 138Labs findet hierbei nicht statt.

## 5. Cloudflare

Nach der aktuellen Cloudflare-DNS-Konfiguration werden `138labs.de` und `www.138labs.de` ueber Cloudflare proxied. Cloudflare kann dabei technische Zugriffsdaten verarbeiten, um die Website auszuliefern, zu beschleunigen und vor Missbrauch zu schuetzen.

Anbieter:

Cloudflare, Inc.  
101 Townsend St.  
San Francisco, CA 94107  
USA

Zweck der Verarbeitung:

- DNS-/Proxy-Betrieb
- TLS-/HTTPS-Bereitstellung
- Performance-Optimierung
- Schutz vor Angriffen und Missbrauch
- Routing von Website-Anfragen
- DDoS-Schutz
- Bot- und Missbrauchserkennung
- Schutz vor automatisiertem Auslesen oeffentlich sichtbarer E-Mail-Adressen

Kategorien personenbezogener Daten:

- IP-Adresse
- technische Request-Daten
- HTTP-Header
- Browser- und Geraeteinformationen
- Sicherheitsereignisse
- ggf. Cloudflare-spezifische technische Cookies oder IDs, sofern durch aktivierte Cloudflare-Funktionen gesetzt

Nach aktueller Dashboard-Pruefung sind insbesondere folgende Cloudflare-Funktionen aktiv oder relevant:

- Proxy/CDN fuer `138labs.de` und `www.138labs.de`
- automatische SSL/TLS- und HTTP-DDoS-Schutzmechanismen
- Cloudflare Managed Ruleset
- Block AI Bots
- Browser Integrity Check
- Email Address Obfuscation
- Challenge Passage mit 30 Minuten

Nach aktueller Dashboard-Pruefung sind keine eigenen Custom Security Rules, keine Rate-Limiting-Regeln, keine aktiven eigenen Managed-WAF-Regeln, kein Bot Fight Mode, kein AI Labyrinth, kein Continuous Script Monitoring und kein Hotlink Protection aktiviert.

Rechtsgrundlage:

Art. 6 Abs. 1 lit. f DSGVO. Unser berechtigtes Interesse liegt in der sicheren und performanten Bereitstellung der Website.

Empfaenger:

Cloudflare und ggf. mit Cloudflare verbundene Unterauftragsverarbeiter.

Drittlanduebermittlung:

Eine Uebermittlung in Drittlaender, insbesondere die USA, kann nicht ausgeschlossen werden. Das Cloudflare Data Processing Addendum wurde heruntergeladen und dokumentiert. Die Standardvertragsklauseln (SCC) sind im Cloudflare-DPA enthalten bzw. dort ausdruecklich referenziert. Weitere Details zur Speicherdauer richten sich nach der jeweiligen Cloudflare-Konfiguration.

Speicherdauer:

Die Speicherdauer richtet sich nach der jeweiligen Cloudflare-Konfiguration und den Cloudflare-Bedingungen. In Cloudflare Security Analytics sind gesampelte Sicherheitsereignisse mit Zeit, Source IP, Host, Pfad und Massnahme sichtbar.

Pflicht zur Bereitstellung:

Die Verarbeitung ist technisch erforderlich, wenn die Website ueber Cloudflare aufgerufen wird.

Automatisierte Entscheidungen / Profiling:

Ein Profiling durch 138Labs findet nicht statt. Cloudflare kann automatisierte Sicherheitsanalysen zur Missbrauchserkennung einsetzen.

Weitere Informationen:

https://www.cloudflare.com/privacypolicy/  
https://www.cloudflare.com/cloudflare-customer-dpa/

## 6. Server-Logfiles

Beim Abruf der Website koennen Server-Logfiles entstehen. Diese Logfiles dienen der technischen Bereitstellung, Sicherheit, Fehleranalyse und Missbrauchserkennung.

Zweck der Verarbeitung:

- technische Auslieferung der Website
- Diagnose von Fehlern
- Absicherung der Systeme
- Untersuchung von Missbrauchsversuchen

Kategorien personenbezogener Daten:

- Zeitpunkt des Abrufs
- HTTP-Methode
- angeforderter Pfad bzw. URI ohne Query-String
- HTTP-Protokoll
- Statuscode
- Antwortgroesse

Nach dem im Repo dokumentierten Zielstand werden in den Nginx-Access-Logs der Website keine IP-Adressen, Referrer, User-Agents oder Query-Strings gespeichert. Diese Konfiguration wird nach Rebuild und Deployment des Coolify-Containers wirksam. IP-Adressen koennen aber auf vorgelagerten technischen Ebenen, insbesondere durch Traefik, Cloudflare oder den Hostingbetrieb, fuer Routing, TLS, Sicherheit und Missbrauchsschutz verarbeitet werden.

Rechtsgrundlage:

Art. 6 Abs. 1 lit. f DSGVO.

Empfaenger:

- Serverbetrieb / Hostinganbieter
- technische Administration

Drittlanduebermittlung:

Der Serverstandort liegt nach aktueller Angabe in Deutschland. Eine Drittlanduebermittlung durch die serverseitigen Nginx-/Docker-Logs ist danach nicht ersichtlich. Cloudflare wird hiervon getrennt betrachtet.

Speicherdauer:

Container-Logs werden nach aktuellem technischen Stand groessenbasiert rotiert. Pro Docker-Container werden maximal drei Logdateien mit jeweils maximal 10 MB vorgehalten. Eine feste zeitliche Speicherdauer, zum Beispiel eine bestimmte Anzahl von Tagen, ist dadurch nicht garantiert; die tatsaechliche Dauer haengt vom Logvolumen ab.

Pflicht zur Bereitstellung:

Die Verarbeitung ist fuer den Websiteabruf technisch erforderlich.

Automatisierte Entscheidungen / Profiling:

Nein.

## 7. SSL-/TLS-Verschluesselung

Diese Website ist per HTTPS verschluesselt. Eine verschluesselte Verbindung erkennen Sie in der Regel an `https://` in der Adresszeile des Browsers.

Die Verschluesselung dient dazu, die Uebertragung zwischen Ihrem Browser und unserer Website gegen Mitlesen oder Veraenderung durch Dritte zu schuetzen.

## 8. Kontaktaufnahme

Sie koennen 138Labs per E-Mail oder Telefon kontaktieren. Wenn Sie Kontakt aufnehmen, verarbeiten wir die von Ihnen uebermittelten Daten zur Bearbeitung Ihrer Anfrage.

Zweck der Verarbeitung:

- Bearbeitung von Anfragen
- Kommunikation mit Interessenten, Kunden und Geschaeftspartnern
- Vorbereitung oder Durchfuehrung vertraglicher Leistungen

Kategorien personenbezogener Daten:

- Name, sofern angegeben
- E-Mail-Adresse
- Telefonnummer, sofern angegeben
- Organisation, sofern angegeben
- Inhalt Ihrer Nachricht
- Kommunikationsmetadaten
- weitere Daten, die Sie freiwillig uebermitteln

Rechtsgrundlage:

Wenn Ihre Anfrage auf den Abschluss oder die Durchfuehrung eines Vertrags gerichtet ist, erfolgt die Verarbeitung auf Grundlage von Art. 6 Abs. 1 lit. b DSGVO. In allen anderen Faellen erfolgt die Verarbeitung auf Grundlage von Art. 6 Abs. 1 lit. f DSGVO. Unser berechtigtes Interesse liegt in der Beantwortung von Anfragen und der Kommunikation mit Interessenten.

Empfaenger:

- 138Labs / Robert Hormann
- E-Mail-Anbieter: IONOS SE
- Telekommunikationsanbieter: Vodafone GmbH

Drittlanduebermittlung:

Eine Drittlanduebermittlung durch die Kontaktkommunikation ist nach aktueller Einschaetzung nicht ersichtlich. Massgeblich bleiben die jeweiligen Datenschutz- und Vertragsbedingungen von IONOS und Vodafone.

Speicherdauer:

Allgemeine Kontaktanfragen per E-Mail oder Telefon werden nach Abschluss der Anfrage grundsaetzlich innerhalb von 12 Monaten geloescht, sofern keine gesetzliche Aufbewahrungspflicht oder laufende geschaeftliche Beziehung besteht. Vertrags-, projekt- oder abrechnungsrelevante Kommunikation wird entsprechend gesetzlicher und geschaeftlicher Erforderlichkeit aufbewahrt.

Pflicht zur Bereitstellung:

Die Bereitstellung ist freiwillig. Ohne die erforderlichen Kontaktdaten koennen wir Ihre Anfrage jedoch nicht beantworten.

Automatisierte Entscheidungen / Profiling:

Nein.

## 9. Benutzerkonto / Registrierung

Auf der Website ist aktuell kein Benutzerkonto und keine Registrierung implementiert.

## 10. Login-Systeme

Auf der Website ist aktuell kein Login-System implementiert.

## 11. Cookies und lokale Speicherung

Nach aktueller technischer Pruefung setzt die Website selbst keine Tracking-Cookies.

Die Website verwendet jedoch den lokalen Browser-Speicher (`localStorage`), um die Sprachwahl zu speichern. Der gespeicherte Eintrag lautet:

```text
138labs-language
```

Zweck der Verarbeitung:

- Speicherung der bevorzugten Sprache
- nutzerfreundliche Anzeige der Website

Kategorien personenbezogener Daten:

- Sprachpraeferenz, zum Beispiel `de` oder `en`

Rechtsgrundlage:

Art. 6 Abs. 1 lit. f DSGVO. Unser berechtigtes Interesse liegt darin, die von Ihnen gewaehlte Sprache beim naechsten Seitenaufruf wiederzuverwenden.

Empfaenger:

Keine Uebermittlung an 138Labs erkennbar. Die Speicherung erfolgt im Browser des Nutzers.

Drittlanduebermittlung:

Keine erkennbar.

Speicherdauer:

Bis zur Loeschung durch den Nutzer, durch Browsereinstellungen oder durch Ueberschreiben der Auswahl.

Pflicht zur Bereitstellung:

Freiwillig. Sie koennen die Website auch ohne dauerhafte Speicherung der Sprachwahl nutzen.

Automatisierte Entscheidungen / Profiling:

Nein.

## 12. Consent Management Plattform

Eine Consent Management Plattform ist aktuell nicht implementiert.

Nach aktuellem Code-Stand werden keine Analytics- oder Marketing-Cookies eingesetzt. Falls kuenftig Tracking, Conversion-Messung, Marketing-Tags oder aehnliche Dienste eingefuehrt werden, muss vorab geprueft werden, ob eine Einwilligung erforderlich ist.

## 13. Analyse- und Trackingdienste

Aktuell sind im Website-Code keine Analyse- oder Trackingdienste wie Google Analytics, Matomo, Plausible, PostHog, Hotjar oder vergleichbare Dienste erkennbar.

In der internen Roadmap ist Analytics/Conversion-Tracking zudem als moegliche spaetere Erweiterung genannt. Vor einer Umsetzung muss die Datenschutzerklaerung aktualisiert und ggf. eine Einwilligungsloesung eingefuehrt werden.

## 14. Newsletter

Ein Newsletter ist auf der Website aktuell nicht implementiert.

## 15. Zahlungsanbieter

Zahlungsanbieter sind auf der Website aktuell nicht eingebunden.

## 16. KI-Dienste

Die Website beschreibt Leistungen im Bereich KI-Prototyping, Automatisierung und Workshops. Nach aktueller technischer Pruefung bindet die Website selbst keine KI-Dienste wie OpenAI, ElevenLabs, n8n-Workflows oder Chatbots ein.

Wenn im Rahmen von Kundenprojekten KI-Dienste eingesetzt werden, erfolgt dies nicht automatisch durch den Besuch dieser Website. Solche Verarbeitungen muessen projektspezifisch dokumentiert und vertraglich geregelt werden.

## 17. Social-Media-Links

Die Website enthaelt Links zu externen Profilen:

- LinkedIn
- GitHub

Beim reinen Besuch unserer Website werden nach aktueller technischer Pruefung keine Inhalte von LinkedIn oder GitHub geladen. Erst wenn Sie einen Link anklicken, verlassen Sie unsere Website. Dann koennen die jeweiligen Anbieter personenbezogene Daten verarbeiten.

Zweck der Verarbeitung:

- Verlinkung auf berufliche Profile und Projektpraesenzen

Kategorien personenbezogener Daten:

- beim Klick: IP-Adresse, Browserdaten, Referrer, ggf. Accountdaten beim jeweiligen Anbieter

Rechtsgrundlage:

Art. 6 Abs. 1 lit. f DSGVO. Unser berechtigtes Interesse liegt in der Darstellung beruflicher Kontakt- und Projektmoeglichkeiten.

Empfaenger:

- LinkedIn
- GitHub

Drittlanduebermittlung:

Moeglich, insbesondere in die USA. Fuer die weitere Verarbeitung sind die jeweiligen Anbieter verantwortlich.

Speicherdauer:

Nach den Datenschutzinformationen der jeweiligen Anbieter.

Pflicht zur Bereitstellung:

Freiwillig. Sie muessen diese Links nicht anklicken.

Automatisierte Entscheidungen / Profiling:

Durch die Zielanbieter moeglich. 138Labs fuehrt hierbei kein Profiling durch.

## 18. Eingebettete Inhalte

Nach aktueller technischer Pruefung sind keine eingebetteten Inhalte von Drittanbietern wie YouTube, Vimeo, Karten, externen Widgets oder Social-Media-Feeds eingebunden.

## 19. Speicherdauer

Soweit in dieser Datenschutzerklaerung keine konkrete Speicherdauer genannt ist, speichern wir personenbezogene Daten nur so lange, wie dies fuer den jeweiligen Zweck erforderlich ist.

Darueber hinaus speichern wir Daten, wenn gesetzliche Aufbewahrungspflichten bestehen oder wir ein berechtigtes Interesse an der weiteren Speicherung haben, etwa zur Geltendmachung, Ausuebung oder Verteidigung von Rechtsanspruechen.

Die konkrete Speicherdauer fuer Cloudflare-Logs richtet sich nach der jeweiligen Cloudflare-Konfiguration und den Cloudflare-Bedingungen. Fuer Docker-Containerlogs ist aktuell eine groessenbasierte Rotation dokumentiert. Fuer allgemeine Kontaktanfragen gilt der in Abschnitt 8 dokumentierte Loesch- und Aufbewahrungsprozess.

## 20. Betroffenenrechte

Sie haben nach Massgabe der DSGVO insbesondere folgende Rechte:

- Recht auf Auskunft nach Art. 15 DSGVO
- Recht auf Berichtigung nach Art. 16 DSGVO
- Recht auf Loeschung nach Art. 17 DSGVO
- Recht auf Einschraenkung der Verarbeitung nach Art. 18 DSGVO
- Recht auf Datenuebertragbarkeit nach Art. 20 DSGVO
- Recht auf Widerspruch nach Art. 21 DSGVO

Zur Ausuebung Ihrer Rechte koennen Sie sich an robert@138labs.de wenden.

## 21. Widerrufsrecht

Wenn eine Verarbeitung auf Ihrer Einwilligung beruht, koennen Sie diese Einwilligung jederzeit mit Wirkung fuer die Zukunft widerrufen.

Die Rechtmaessigkeit der Verarbeitung bis zum Widerruf bleibt unberuehrt.

## 22. Beschwerderecht bei einer Aufsichtsbehoerde

Sie haben das Recht, sich bei einer Datenschutzaufsichtsbehoerde zu beschweren, wenn Sie der Ansicht sind, dass die Verarbeitung Ihrer personenbezogenen Daten gegen Datenschutzrecht verstoesst.

Zustaendige Aufsichtsbehoerde kann insbesondere die Datenschutzaufsichtsbehoerde Ihres Aufenthaltsorts, Ihres Arbeitsplatzes oder des Orts des mutmasslichen Verstosses sein.

Fuer Nordrhein-Westfalen ist dies:

Landesbeauftragte fuer Datenschutz und Informationsfreiheit Nordrhein-Westfalen  
Kavalleriestr. 2-4  
40213 Duesseldorf  
Website: https://www.ldi.nrw.de/

## 23. Widerspruchsrecht nach Art. 21 DSGVO

Wenn wir personenbezogene Daten auf Grundlage von Art. 6 Abs. 1 lit. f DSGVO verarbeiten, haben Sie das Recht, aus Gruenden, die sich aus Ihrer besonderen Situation ergeben, jederzeit Widerspruch gegen diese Verarbeitung einzulegen.

Wir verarbeiten die betroffenen personenbezogenen Daten dann nicht mehr, es sei denn, wir koennen zwingende schutzwuerdige Gruende fuer die Verarbeitung nachweisen, die Ihre Interessen, Rechte und Freiheiten ueberwiegen, oder die Verarbeitung dient der Geltendmachung, Ausuebung oder Verteidigung von Rechtsanspruechen.

## 24. Datenuebermittlungen in Drittlaender

Eine Uebermittlung personenbezogener Daten in Laender ausserhalb der EU/des EWR kann insbesondere bei Cloudflare sowie beim Anklicken externer Links zu LinkedIn oder GitHub nicht ausgeschlossen werden.

Fuer Cloudflare wurden das Data Processing Addendum und die darin enthaltenen bzw. referenzierten Standardvertragsklauseln dokumentiert.

Bei externen Links erfolgt eine Uebermittlung erst, wenn Sie den jeweiligen Link aktiv anklicken.

## 25. Stand und Aenderungen

Diese Datenschutzerklaerung basiert auf dem am 2026-06-09 geprueften Code-Stand der Website. Wenn neue Funktionen wie Kontaktformulare, Newsletter, Analytics, Buchungstools, eingebettete Inhalte oder KI-Dienste eingebunden werden, muss diese Datenschutzerklaerung vor der Veroeffentlichung aktualisiert werden.
