### Setup local https with self signed certificate

Chrome 58+ requires Subject Alternative Name. This can be done with the command below

openssl req \
-newkey rsa:2048 \
-x509 \
-nodes \
-keyout file.key \
-new \
-out file.crt \
-subj /CN=local.website.dev \
-reqexts SAN \
-extensions SAN \
-config <(cat /etc/ssl/openssl.cnf \
    <(printf '[SAN]\nsubjectAltName=DNS:local.website.dev,IP:127.0.0.1')) \
-sha256 \
-days 365

openssl x509 -text -noout -in localhost.crt

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain localhost.crt

Add local.website.dev to /etc/hosts

### Run docker compose

docker-compose up

### Run the container independently
docker build -t nginx-demo .
docker run -p 8080:8080 -it nginx-demo

