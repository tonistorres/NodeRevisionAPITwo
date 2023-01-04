
ADICIONANDO_LINHAS_DE_CONFIGURACOS_PACKAGE_JSON(){
sed -i '7 i\    "start": "node src/server.js",' ./package.json
sed -i '8 i\    "dev": "nodemon src/server.js",' ./package.json
sed -i '9 i\    "lint": "eslint --no-inline-config --no-error-on-unmatched-pattern -c .eslintrc.json .",' ./package.json
sed -i '10 i\    "kill": "killall node",' ./package.json
}

# ADICIONANDO_LINHAS_DE_CONFIGURACOS_PACKAGE_JSON
