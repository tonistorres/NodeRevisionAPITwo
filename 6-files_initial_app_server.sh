CRIANDO_CONFIGURANDOS_ARQUIVOS_INICIAIS_APPLICACAO(){
  cd src
  touch app.js
  touch server.js
}

CRIANDO_CONTEUDO_APP(){
cat << EOF > app.js
// Importando o Express e iniciou ele em seu programa com a função express()
// e o colocou na variável app, exportando a variável app para poder usá-la
// no arquivo server.js.
const express = require('express');

const app = express();

app.get('/', (req, res) => res.status(200).json({ message: 'Olá Mundo!' }));
app.get('/html', (req, res) => res.status(200).send('<h1>Retornando uma Menssagem HTML</h1>'));
app.get('/redirect', (req, res) => res
  .status(200).redirect('https://www.linkedin.com/in/tonistorres/'));
app.get('/end', (req, res) => res.status(200).end());
module.exports = app;
EOF

}


CRIANDO_CONTEUDO_SERVER(){
cat << EOF >> server.js
const app = require('./app');

app.listen(3001, () => console.log('server running on port 3001'));
EOF
}

LOTE_EXECUTE(){
  CRIANDO_CONFIGURANDOS_ARQUIVOS_INICIAIS_APPLICACAO
  CRIANDO_CONTEUDO_APP
  CRIANDO_CONTEUDO_SERVER
  cd ..
}

# LOTE_EXECUTE
