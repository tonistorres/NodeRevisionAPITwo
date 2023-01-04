CRIANDO_ARQUIVOS_NECESSARIOS_CONFIGURACAO(){
  touch .eslintignore .eslintrc.json
}

ESCREVENDO_ARQUIVO_ESLINTRCJSON(){
cat << EOF > .eslintrc.json
// Usado para você sobrescrever regras do ESLint;
{
  "env": {
    "es2020": true
  },
  "extends": "trybe-backend",
  "rules": {
    "sonarjs/no-duplicate-string": ["error", 5]
  }
}
EOF
}


ESCREVENDO_ARQUIVO_ESLINTIGNORE(){
cat << EOF > .eslintignore
# Usado para você dizer ao ESLint que ignore arquivos e diretórios específicos;
# Ignorar arquivos contidos dentro na pasta node módules, ou seja, não será aplicado
# regras do esLint da trybe a esse diretório da aplicação pois não faz sentido
node_modules/
EOF
}




INSTALANDO_LINT(){
  npm i eslint@6.8.0 eslint-config-trybe-backend@1.0.1 --save-dev --save-exact
  CRIANDO_ARQUIVOS_NECESSARIOS_CONFIGURACAO
  ESCREVENDO_ARQUIVO_ESLINTRCJSON
  ESCREVENDO_ARQUIVO_ESLINTIGNORE
}

# INSTALANDO_LINT
