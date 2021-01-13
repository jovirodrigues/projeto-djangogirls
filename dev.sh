HOST=joaorodrigues.busercamp.com.br

function devhelp() {
  echo " dkbuild   constri a imagem docker"
  echo " dkrun     roda o projeto dockerizado"
  echo " deploy    Excluí um monte de coisas (dks, static, sqlite3"
}

function dkbuild() {
  docker build -t joaorodrigues .
}

function dkrun() {
  docker run -it -p 8000:8000 \
  -e DATABASE_FILE=/dkdata/db.sqlite3 \
  -e DJANGO_STATIC_ROOT=/dkdata/static \
  -v $(pwd)/dkdata:/dkdata \
  joaorodrigues start.sh
}

function deploy(){
  rsync -av --exclude dkdata --exclude db.sqlite3 \
  ./* ubuntu@$HOST:./joaorodrigues/
  ssh ubuntu@$HOST "cd joaorodrigues && ./dkrunprod.sh"
}
devhelp
