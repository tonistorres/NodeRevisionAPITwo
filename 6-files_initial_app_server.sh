CRIANDO_CONFIGURANDOS_ARQUIVOS_INICIAIS_APPLICACAO(){
  cd src
  touch app.js
  touch server.js
}

CRIANDO_CONTEUDO_APP(){
cat << EOF > app.js
const express = require('express');
const cors = require("cors");
const morgan = require('morgan');
require('express-async-errors');

const app = express();
app.use(cors());
app.use(morgan('combined'));
app.use(express.json());

app.get('/', (req, res) => res.status(200).json({ message: 'Olá Mundo!' }));
app.get('/html', (req, res) => res.status(200).send('<h1>Retornando uma Menssagem HTML</h1>'));
app.get('/redirect', (req, res) => res
  .status(200).redirect('https://www.linkedin.com/in/tonistorres/'));
app.get('/end', (req, res) => res.status(200).end());

app.use((req, res) => res.sendStatus(404));

app.use((error, req, res, next) => {
  console.error(error.stack);
  next(error);
});

app.use((error, _req, res, _next) => {
  return res.status(500).json({ message: `Algo deu errado! Mensagem: ${error.message}` });
});



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
