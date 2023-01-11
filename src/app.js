const express = require('express');
const fileWrite = require('./utils/fsUtils');
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

/** Buscando Todos os Membros embutidos no array de objetos */
app.get('/members', async (req, res) => {
  const allMembers = await fileWrite.readFileJsonAsync();
  if (!allMembers) {
    res.status(404).json({ message: 'Member Not Value' });
  }
  return res.status(200).json(allMembers);
});

/** Adicionando um Membro e retornando */
app.post('/member', async (req, res) => {
  const newMember = { ...req.body };
  if (!newMember) {
    res.status(404).json({ message: 'Member Not Found' });
  }
  await fileWrite.writeFilCreate(newMember);
  return res.status(201).json(newMember);
});

/** Editando Membros */
app.put('/members/:id', async (req, res) => {
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
  res.status(200).json(memBack);
});

app.delete('/members/delete/:id', async (req, res) => {
  const { id } = req.params;
  const datas = await fileWrite.readFileJsonAsync();
  const listFileter = datas.filter((element) => element.register !== Number(id));
  await fileWrite.writeFileUpadate(listFileter);
  res.send('Removido com sucesso!');
});

module.exports = app;
