const express = require('express');
const fileWrite = require('./utils/fsUtils');
const cors = require("cors");
const morgan = require('morgan');
const {
  validationMemberId,
  validationData,
} = require('../src/middlewares/validationsMember');

require('express-async-errors');

const app = express();
/**
 * CORS - Compartilhamento de Recurso de Origens
 */
app.use(cors());
app.use(morgan('combined'));
/**
 * Responsabilidade: Caso haja no corpo da requisição(body) uma string no formato json
 * ele irá fazer de forma automagica o processo de conversão para um objeto javascript
 * pegando as chaves e valores dessa string json e montando-as no objeto javascript
 */
app.use(express.json());

/**
 * Responsabilidade: fornecer acesso a arquivos estáticos. O que seria um arquivo estático?
 * uma foto, uma musica, um vídeo, um arquivo ...
 * Endpoint: http://localhost:3001/static/perfil.jpeg
 */

/**
 * Morgan utilizado para rastreiar todo acesso feito há algum end point na nossa api
 *
 */



app.use('/static', express.static(__dirname + '/public'));

/**
 * Buscando Todos os Membros embutidos no array de objetos
 *  */
app.get('/members', async (req, res) => {
  try {
    const allMembers = await fileWrite.readFileJsonAsync();
    if (!allMembers) {
      res.status(404).json({ message: 'Member Not Value' });
    }
    return res.status(200).json(allMembers);
  } catch (error) {
    return next(error)
  }

});

/**
 * Buscando Membro por ID
 *  */
app.get('/members/:id', validationMemberId, async (req, res) => {
  try {
    const { id } = req.params;
    const datas = await fileWrite.readFileJsonAsync();
    const memBack = datas.find((element) => element.register === Number(id));
    res.status(200).json(memBack);

  } catch (error) {
    return next(error);
  }

});

/**
 *  Adicionando um Membro e retornando
 */
app.post('/member', validationData, async (req, res) => {
  try {
    const newMember = { ...req.body };
    if (!newMember) {
      res.status(404).json({ message: 'Member Not Found' });
    }
    await fileWrite.writeFilCreate(newMember);
    return res.status(201).json(newMember);
  } catch (error) {
    return next(error);
  }

});

/**
 *  Editando Membros
  */
app.put('/members/:id', validationMemberId, validationData, async (req, res) => {
  const { id } = req.params;
  const memFront = req.body;
  const datas = await fileWrite.readFileJsonAsync();
  const memBack = datas.find((element) => element.register === Number(id));
  memBack.name = memFront.name; memBack.baptism = memFront.baptism;
  memBack.birth = memFront.birth; memBack.country = memFront.country;
  memBack.state = memFront.state; memBack.city = memFront.city;
  memBack.district = memFront.district; memBack.mother = memFront.mother;
  memBack.dad = memFront.dad; memBack.status = memFront.status;
  await fileWrite.writeFileUpadate(datas);
  res.status(200).send('Atualizando com sucesso!!')
});

/**
 * Deletando membro
 */
app.delete('/members/delete/:id', validationMemberId, async (req, res) => {
  const { id } = req.params;
  const datas = await fileWrite.readFileJsonAsync();
  const listFileter = datas.filter((element) => element.register !== Number(id));
  await fileWrite.writeFileUpadate(listFileter);
  res.status(200).send('Removido com sucesso!');
});

// se ninguém respondeu, vai cair neste middleware
app.use((req, res) => res.sendStatus(404));

/** Captura qualquer exceção disparada de qualquer lugar
 *  da minha aplicação  esse middleware trata e receber a mensagem
 * de error bonitinha caso haja e caso contrário manda para o middleware
 * abaixo que irá imprimier error internal server  */
app.use((error, req, res, next) => {
  console.error(error.stack);
  next(error);
})

//Middleware responsável por capturar os next(error) lançados pelas funções
// e end-points da aplicação
app.use((error, _req, res, _next) => {
  return res.status(500).json({ message: `Algo deu errado! Mensagem: ${error.message}` });
});

module.exports = app;
