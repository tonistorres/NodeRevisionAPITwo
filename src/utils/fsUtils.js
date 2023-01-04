const PATH_DATA = '../data/member.json';
const fs = require('fs').promises;
const path = require('path');

async function readFileJsonAsync() {
  try {
    const contentFile = await fs.readFile(path.resolve(__dirname, PATH_DATA));
    const dataMembers = JSON.parse(contentFile);
    return dataMembers;
  } catch (err) {
    console.error(`Erro ao ler o arquivo: ${err.message}`);
  }
}

async function writeFilCreate(newMember) {
  try {
    const oldMembers = await readFileJsonAsync();
    const allMembers = JSON.stringify([...oldMembers, { register: Date.now(), ...newMember }]);
    await fs.writeFile(path
      .resolve(__dirname, PATH_DATA), allMembers);
  } catch (err) {
    console.error(`Erro ao escrever o arquivo: ${err.message}`);
  }
}

async function writeFileUpadate(listMember) {
  try {
    // const oldMembers = await readFileJsonAsync();

    const memberUpdate = JSON.stringify([...listMember]);
    await fs.writeFile(path
      .resolve(__dirname, PATH_DATA), memberUpdate);
  } catch (err) {
    console.error(`Erro ao escrever o arquivo: ${err.message}`);
  }
}

module.exports = {
  readFileJsonAsync,
  writeFilCreate,
  writeFileUpadate,
};
