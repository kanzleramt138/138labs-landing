# Server-Log-Audit: 138labs.de

Stand: 2026-06-08

Diese Auswertung dokumentiert den am 2026-06-08 technisch geprueften Stand der serverseitigen Request- und Systemlogs fuer `138labs.de`. Sie dient als Arbeitsgrundlage fuer die Datenschutzerklaerung und die offene Datenschutz-Checkliste.

Hinweis zum Umsetzungsstand:

- Der laufende Container nutzte bei der technischen Pruefung noch das Standard-Nginx-Logformat.
- Im Repo ist jetzt eine eigene `nginx.conf` umgesetzt, die das Access-Log datensparsam reduziert.
- Die neue Log-Konfiguration wird erst nach Rebuild und Deployment des Coolify-Containers wirksam.

## Kurzfazit

- Die Website `138labs.de` wird als statische Nginx-Anwendung in Docker ueber Coolify betrieben.
- Eingehende HTTP/HTTPS-Requests laufen ueber den Coolify-Traefik-Proxy zum Nginx-Container der Website.
- Nginx Access-Logs bleiben aktiv, werden aber im Repo auf ein datensparsames Format ohne IP-Adresse, Referrer, User-Agent und Query-String reduziert.
- Docker speichert stdout/stderr der Container mit dem Logging-Driver `json-file`.
- Docker-Logrotation ist global aktiv: `max-size=10m`, `max-file=3`.
- Traefik Access-Logs sind nach aktueller Proxy-Konfiguration nicht explizit aktiviert.
- Es wurde kein lokaler Mailserver fuer `138labs.de` auf dem Server erkannt.
- Debug-Logging ist fuer Traefik und Nginx nicht erkennbar aktiviert; Nginx Error-Logs sind im Repo auf `warn` gesetzt.

## 1. Welche Komponenten loggen Requests?

### Nginx

Relevant.

Der Website-Container basiert auf dem offiziellen Nginx-Image:

- Repo-Datei: `Dockerfile`
- Inhalt: `FROM nginx:alpine`
- Repo-Datei fuer Logging: `nginx.conf`
- Container: `k12j4mdochno6z703tqeee1j-012952090317`
- Coolify-Resource: `138labs-landingmain-k12j4mdochno6z703tqeee1j`
- Domains laut Traefik-Labels: `138labs.de`, `www.138labs.de`

Nginx schreibt:

- Access-Log: `/var/log/nginx/access.log -> /dev/stdout`
- Error-Log: `/var/log/nginx/error.log -> /dev/stderr`

Damit landen Nginx-Request-Logs im Docker-JSON-Log des Website-Containers. Durch die neue Repo-Konfiguration enthaelt das Access-Log nur noch Zeitpunkt, HTTP-Methode, URI ohne Query-String, Protokoll, Statuscode und Antwortgroesse.

### Traefik / Coolify Proxy

Teilweise relevant.

Der Coolify-Proxy laeuft als Traefik-Container:

- Container: `coolify-proxy`
- Image: `traefik:v3.6`
- Ports: `80`, `443`, `443/udp`
- Compose-Datei: `/data/coolify/proxy/docker-compose.yml`

Traefik verarbeitet alle eingehenden Requests fuer `138labs.de` und leitet sie an den Nginx-Container weiter.

Nach aktueller Konfiguration ist kein explizites Traefik Access-Log aktiviert. In der Proxy-Compose-Datei wurden keine Traefik-Flags wie `--accesslog=true` oder `--log.level=DEBUG` gefunden. Traefik kann aber operative Logs in stdout/stderr schreiben; diese landen im Docker-JSON-Log des `coolify-proxy`-Containers.

### Coolify

Indirekt relevant.

Coolify verwaltet Deployment, Container, Labels und Routing-Konfiguration. Coolify selbst ist nicht der Request-Handler fuer `138labs.de`, kann aber Deployment-, Verwaltungs- und Fehlerlogs erzeugen.

Relevante Container:

- `coolify`
- `coolify-realtime`
- `coolify-db`
- `coolify-redis`
- `coolify-sentinel`

Fuer die Datenschutzerklaerung von `138labs.de` sind Coolify-Logs hauptsaechlich als Admin-/Betriebslogs relevant, nicht als primaere Website-Access-Logs.

### Docker

Relevant.

Docker speichert stdout/stderr der Container mit dem global konfigurierten Logging-Driver:

- Datei: `/etc/docker/daemon.json`
- `log-driver`: `json-file`
- `max-size`: `10m`
- `max-file`: `3`

Damit entstehen pro relevantem Container rotierende JSON-Logdateien unter `/var/lib/docker/containers/...`.

### Mailserver

Nach aktueller Pruefung nicht relevant fuer diesen Server.

Es wurde kein lokaler Mailserver-Container erkannt. Die offenen Ports zeigen keine typischen Mailports wie `25`, `465`, `587`, `993` oder `995`. Kontakt per E-Mail an `robert@138labs.de` wird daher voraussichtlich durch einen externen Mailanbieter verarbeitet und muss separat geklaert werden.

## 2. Welche Logdateien oder Docker-Logs sind relevant?

### Primaer relevant fuer `138labs.de`

Nginx Website-Container:

- Container: `k12j4mdochno6z703tqeee1j-012952090317`
- Docker-Logpfad laut `docker inspect`:
  `/var/lib/docker/containers/b5a7a17b7b8e7278d4335ea325e3069377f544bd43054836064f36de93ac10df/b5a7a17b7b8e7278d4335ea325e3069377f544bd43054836064f36de93ac10df-json.log`
- Zweck: Nginx Access- und Error-Logs der produktiven Website.

### Sekundaer relevant

Traefik / Coolify Proxy:

- Container: `coolify-proxy`
- Docker-Logpfad laut `docker inspect`:
  `/var/lib/docker/containers/a45f825fc4bd113ebbe436fb399f9c5b408623feff1843298bc9189fd1a36b94/a45f825fc4bd113ebbe436fb399f9c5b408623feff1843298bc9189fd1a36b94-json.log`
- Zweck: Traefik Betriebslogs; nach aktueller Konfiguration kein explizites Access-Log.

Coolify:

- Container: `coolify`
- Docker-Logpfad laut `docker inspect`:
  `/var/lib/docker/containers/e1a5375ad6cf8a5fab04736083f41f57ef338fffdec4e0089b8c7dc83a32b64a/e1a5375ad6cf8a5fab04736083f41f57ef338fffdec4e0089b8c7dc83a32b64a-json.log`
- Zweck: Coolify Verwaltungs-/Deployment-Logs.

### Entwicklungsdomain

Nicht primaer fuer die Datenschutzerklaerung der produktiven Website, aber technisch aehnlich:

- Domain: `dev.138labs.de`
- Container: `hkt09kqmps1lipuhrwz817y1-010328530931`
- Coolify-Resource: `138labs-landingdevelop-hkt09kqmps1lipuhrwz817y1`
- Docker-Logpfad laut `docker inspect`:
  `/var/lib/docker/containers/e13fb0b4755dac74cc356e85d184210da383c01ca6236bf80aceee783e84f4e5/e13fb0b4755dac74cc356e85d184210da383c01ca6236bf80aceee783e84f4e5-json.log`

## 3. Welche Felder enthalten die Access-Logs?

Die im Repo umgesetzte Nginx-Konfiguration nutzt das datensparsame Logformat `privacy`:

```text
$time_local "$request_method $uri $server_protocol" $status $body_bytes_sent
```

Enthaltene Felder:

- Zeitpunkt: `$time_local`
- HTTP-Methode: `$request_method`
- URI/Pfad ohne Query-String: `$uri`
- Protokoll: `$server_protocol`
- HTTP-Statuscode: `$status`
- Antwortgroesse in Bytes: `$body_bytes_sent`

Datenschutzrelevante Einordnung:

- Im Nginx-Access-Log werden nach Deployment der Repo-Konfiguration keine IP-Adressen protokolliert.
- Im Nginx-Access-Log werden keine Referrer protokolliert.
- Im Nginx-Access-Log werden keine User-Agents protokolliert.
- Im Nginx-Access-Log werden keine Query-Strings protokolliert.
- Es werden weiterhin aufgerufene Pfade/URIs protokolliert. Diese koennen fuer technische Fehleranalyse und grobe Content-Optimierung genutzt werden.
- Traefik und ggf. Cloudflare verarbeiten IP-Adressen weiterhin technisch fuer Routing, TLS, Sicherheit und Missbrauchsschutz; das ist separat von der Nginx-Access-Log-Minimierung zu betrachten.

## 4. Wie lange bleiben die Logs erhalten?

Docker-Logs:

- Globaler Docker-Logging-Driver: `json-file`
- Rotation: `max-size=10m`
- Anzahl Dateien: `max-file=3`
- Effektiv: maximal ca. 30 MB Docker-JSON-Logdaten pro Container.

Eine feste zeitliche Aufbewahrungsdauer, zum Beispiel 7, 14 oder 30 Tage, ist damit nicht garantiert. Die tatsaechliche Dauer haengt vom Request-Volumen und der Logmenge pro Container ab.

Nginx-Logs:

- Keine separaten persistenten Nginx-Dateilogfiles im Container erkannt.
- `/var/log/nginx/access.log` zeigt auf `/dev/stdout`.
- `/var/log/nginx/error.log` zeigt auf `/dev/stderr`.
- Aufbewahrung erfolgt deshalb ueber Docker-JSON-Logs und deren Rotation.
- Nach Deployment der Repo-Konfiguration enthalten die Nginx-Access-Logs nur noch das reduzierte `privacy`-Format.

Traefik-Logs:

- Aufbewahrung ebenfalls ueber Docker-JSON-Logs mit `max-size=10m`, `max-file=3`.

Host-Systemlogs:

- `/etc/logrotate.conf` setzt global `weekly` und `rotate 4`.
- Diese globale logrotate-Konfiguration gilt fuer klassische Host-Logs unter `/var/log`, nicht fuer die Docker-JSON-Logs, die durch Docker selbst rotiert werden.

## 5. Gibt es logrotate oder automatische Loeschung?

Ja, aber auf zwei verschiedenen Ebenen:

### Docker-Logrotation

Belegt durch `/etc/docker/daemon.json`:

```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
```

Dies ist die relevante Rotation fuer Nginx-, Traefik- und Coolify-Containerlogs.

### Host-logrotate

Belegt durch:

- `/etc/logrotate.conf`
- `/etc/logrotate.d/*`
- `/etc/cron.daily/logrotate`

Globale Host-Konfiguration:

- Rotation: woechentlich
- Aufbewahrung: 4 Rotationen

Diese Rotation betrifft klassische Systemlogs, aber nicht primaer die Docker-JSON-Logs der Website-Container.

## 6. Sind Debug-Logs aktiv?

Nach aktueller Konfigurationspruefung: nein, nicht erkennbar.

Belege:

- In `/data/coolify/proxy/docker-compose.yml` wurden keine Traefik-Flags wie `--log.level=DEBUG` gefunden.
- In `/data/coolify/proxy/docker-compose.yml` wurde kein explizites `--accesslog=true` gefunden.
- Nginx ist im Repo mit `error_log /var/log/nginx/error.log warn;` konfiguriert.
- Die Nginx-Access-Logs sind aktiv, aber das ist normales Access-Logging, kein Debug-Logging.

Einschraenkung:

- Einzelne Anwendungen koennen intern weitere Logs schreiben. Fuer die statische `138labs.de`-Website ist im Repo aber keine eigene Backend-Anwendung vorhanden.

## 7. Wer darf Logs einsehen?

Praktische Zugriffslage am Server:

- Docker-API-Zugriff besteht fuer Benutzer in der Gruppe `docker`.
- Der Benutzer `robert` ist Mitglied der Gruppen `sudo` und `docker`.
- Die Docker-Logdateien liegen unter `/var/lib/docker/containers/...`.
- Direkter Zugriff auf `/var/lib/docker/containers` war fuer den normalen Benutzerkontext nicht moeglich.
- Ueber Docker-Befehle wie `docker logs` koennen Benutzer mit Docker-Rechten Containerlogs einsehen.

Bewertung:

- Logzugriff ist faktisch auf Server-Administratoren bzw. Benutzer mit `sudo`- oder `docker`-Rechten beschraenkt.
- Datenschutzrechtlich sollte dokumentiert werden: Nur berechtigte Administratoren mit Serverzugang duerfen Logs einsehen.
- Wichtig: Mitgliedschaft in der Docker-Gruppe ist administrativ sehr weitreichend und sollte nur vertrauenswuerdigen Admins gegeben werden.

## 8. Welche Konfigurationsdateien belegen das?

### Website-Repo

- `Dockerfile`
  - Belegt Nutzung von `nginx:alpine`.
  - Belegt Kopie von `nginx.conf` nach `/etc/nginx/nginx.conf`.
  - Belegt statische Auslieferung aus `/usr/share/nginx/html`.
  - Belegt explizite Kopie der Website-Dateien in den Webroot statt pauschalem `COPY .`.

- `nginx.conf`
  - Belegt `log_format privacy`.
  - Belegt `access_log /var/log/nginx/access.log privacy`.
  - Belegt `error_log /var/log/nginx/error.log warn`.
  - Belegt, dass IP-Adresse, Referrer, User-Agent und Query-String nicht Bestandteil des Nginx-Access-Logformats sind.

### Coolify App-Konfiguration

- `/data/coolify/applications/k12j4mdochno6z703tqeee1j/docker-compose.yaml`
  - Belegt produktiven Website-Container.
  - Belegt Traefik-Router fuer `138labs.de` und `www.138labs.de`.
  - Belegt Weiterleitung auf internen Container-Port `80`.

- `/data/coolify/applications/hkt09kqmps1lipuhrwz817y1/docker-compose.yaml`
  - Belegt Entwicklungsdomain `dev.138labs.de`.

### Traefik / Coolify Proxy

- `/data/coolify/proxy/docker-compose.yml`
  - Belegt Traefik als Proxy.
  - Belegt Ports `80`, `443`, `443/udp`.
  - Belegt Docker Provider.
  - Belegt fehlende explizite Accesslog-/Debuglog-Flags im geprueften Stand.

### Docker Logging

- `/etc/docker/daemon.json`
  - Belegt Docker-Logging-Driver `json-file`.
  - Belegt Rotation `max-size=10m`, `max-file=3`.

### Nginx im Container

Geprueft per `docker exec` im produktiven Website-Container vor Deployment der Repo-Aenderung:

- `/var/log/nginx/access.log -> /dev/stdout`
- `/var/log/nginx/error.log -> /dev/stderr`
- `/etc/nginx/nginx.conf`
  - Belegt `log_format main`.
  - Belegt `access_log /var/log/nginx/access.log main`.
  - Belegt `error_log /var/log/nginx/error.log notice`.
- `/etc/nginx/conf.d/default.conf`
  - Belegt statische Auslieferung auf Port `80`.

Neuer Repo-Zielzustand nach Rebuild/Deployment:

- `/etc/nginx/nginx.conf`
  - `log_format privacy '$time_local "$request_method $uri $server_protocol" $status $body_bytes_sent';`
  - `access_log /var/log/nginx/access.log privacy;`
  - `error_log /var/log/nginx/error.log warn;`

Verifikation im lokalen Test-Image:

- Build-Befehl: `DOCKER_CONFIG=/tmp/docker-config docker build -t 138labs-landing:privacy-log-test .`
- Konfigurationstest: `DOCKER_CONFIG=/tmp/docker-config docker run --rm 138labs-landing:privacy-log-test nginx -t`
- Ergebnis: `nginx: configuration file /etc/nginx/nginx.conf test is successful`
- Ausgelesenes wirksames Logformat:

```text
log_format  privacy  '$time_local "$request_method $uri $server_protocol" '
                     '$status $body_bytes_sent';

access_log  /var/log/nginx/access.log privacy;
```

### Host-logrotate

- `/etc/logrotate.conf`
- `/etc/logrotate.d/*`
- `/etc/cron.daily/logrotate`

Diese Dateien belegen Host-Logrotation, aber nicht die primaere Rotation der Docker-Containerlogs.

## Offene Punkte fuer die Datenschutzerklaerung

- Eine feste zeitliche Log-Aufbewahrungsdauer ist noch nicht definiert; aktuell ist nur eine groessenbasierte Docker-Rotation belegt.
- Fuer die Datenschutzerklaerung sollte nicht behauptet werden, dass Logs nach einer festen Tagesfrist geloescht werden, solange nur die groessenbasierte Docker-Rotation belegt ist.
- Wenn Cloudflare fuer `138labs.de` vorgeschaltet ist, muessen Cloudflare-Logs, Cloudflare-Analytics, Security Events und etwaige Cookies/IDs separat im Cloudflare-Dashboard geprueft werden.
- Der externe E-Mail-Anbieter fuer `robert@138labs.de` muss separat benannt und bewertet werden.

## Empfehlung

- Docker-Logrotation ist bereits aktiv und fuer kleine statische Websites pragmatisch.
- Das neue Nginx-Logformat ist fuer die statische Landingpage datensparsamer als das Nginx-Standardformat.
- Fuer DSGVO-Transparenz sollte die groessenbasierte Rotation konkret benannt werden.
- Falls spaeter eine konkrete Tagesfrist gewuenscht ist, sollte sie technisch umgesetzt werden, etwa durch restriktivere Docker-Loglimits, einen dokumentierten Loeschprozess oder ein Logging-System mit zeitbasierter Retention.
- Traefik Access-Logs sollten nur aktiviert werden, wenn sie fuer Sicherheit oder Fehleranalyse erforderlich sind.
- Debug-Logs sollten weiterhin deaktiviert bleiben.
