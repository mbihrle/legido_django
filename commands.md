pip freeze > requirements.txt

docker compose -f docker-compose.prod.yml down --volumes --remove-orphans
docker-compose -f ./docker-compose.dev.yml up -d --build
docker-compose -f ./docker-compose.prod.yml up -d --build

Before starting the services, you'll need to obtain SSL certificates from Let's Encrypt using certbot. Run the following command to obtain the certificates:
docker compose -f docker-compose.prod.yml run --rm certbot certonly --webroot --webroot-path=/var/www/certbot --email bihrle.marco@hotmail.com --agree-tos --no-eff-email --force-renewal -d legido.de -d www.legido.de -v

ssh -i ~/.ssh/servweb_strato_id_ed25519 mbadmin@h2992892.stratoserver.net
ssh -i ~/.ssh/servweb_strato_id_ed25519 mbadmin@85.214.134.18

rsync -avz -vv -e "ssh -i ~/.ssh/servweb_strato_id_ed25519" --exclude-from='rsync-exclude.txt' ./ mbadmin@85.214.134.18:~/workspace/legido/