// https://www.youtube.com/watch?v=CR_T9Ahg3A4
const PATH_ORIGIN = '../data/member.json';
const PATH_DEST = '../data/member.json';
const fs = require('fs');
const path = require('path');

function VerifyConditionElse() {
  try {
    if (!fs.existsSync(PATH_DEST)) fs.copyFileSync(PATH_ORIGIN, PATH_DEST);
  } catch (error) {
    console.error(`Erro Gerado em VerifyCondition Else ${error}`);
  }
}

function VerifyConditionalIf() {
  try {
    if (!fs.existsSync(PATH_DEST)) fs.mkdirSync(PATH_DEST);
    fs.readFileSync(PATH_ORIGIN).forEach((childItemName) => {
      // eslint-disable-next-line no-use-before-define, sonarjs/no-extra-arguments
      copyRecursive(path
        .join(PATH_ORIGIN, childItemName), path
          .join(PATH_DEST, childItemName));
    });
  } catch (error) {
    console.error(`Error Gerado em VerifyConditionalIf ${error}`);
  }
}

function copyRecursive() {
  const exist = fs.existsSync(PATH_ORIGIN);
  const stats = exist && fs.statSync(PATH_ORIGIN);
  const isDirectory = stats && stats.isDirectory();

  if (isDirectory) {
    VerifyConditionalIf();
  } else {
    VerifyConditionElse();
  }
}

function removeFile() {
  try {
    if (fs.existsSync(PATH_DEST)) {
      const filePath = PATH_DEST;
      fs.unlinkSync(filePath);
    }
    console.log('Destination folder clear');
  } catch (error) {
    console.error(`Error gerando em removeFile ${error}`);
  }
}

module.exports = {
  copyRecursive,
  removeFile,
};
