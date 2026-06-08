FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf

COPY assets/ /usr/share/nginx/html/assets/
COPY index.html impressum.html datenschutz.html index_referenz.html /usr/share/nginx/html/
COPY favicon.png favicon.svg /usr/share/nginx/html/
COPY logo.png logo.svg logo-glow-green.png logo-glow-violet.png /usr/share/nginx/html/
COPY logo-transparent.png logo-transparent-360.png logo-transparent-520.png logo-transparent-720.png logo-transparent-980.png /usr/share/nginx/html/
COPY person.png /usr/share/nginx/html/

EXPOSE 80
