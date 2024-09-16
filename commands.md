pip freeze > requirements.txt
chmod +x ./entrypoint.sh
docker-compose -f ./docker-compose.dev.yml up -d --build
docker-compose -f ./docker-compose.prod.yml up -d --build
ssh -i ~/.ssh/servweb_strato_id_ed25519 mbadmin@h2992892.stratoserver.net
ssh -i ~/.ssh/servweb_strato_id_ed25519 mbadmin@85.214.134.18

rsync -avz -vv -e "ssh -i ~/.ssh/servweb_strato_id_ed25519" --exclude-from='rsync-exclude.txt' ./ mbadmin@85.214.134.18:~/workspace/legido/