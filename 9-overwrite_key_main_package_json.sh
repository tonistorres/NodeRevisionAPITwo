# A opção -i significa edição no local, ou seja, o sed vai editar/modificar o arquivo
# passado como parâmetro.
# A letra s, no começo, significa que queremos substituir algo;
# g no final significa que queremos fazer uma substituição global,
# sed -i 's/old-text/new-text/g' input.txt
# http://www.zago.eti.br/script/sed.html

ADICIONANDO_LINHA_DE_CODIGO_PARA_EXECUCAO_INICIAL(){
sed -i 's/index.js/src\/server.js/g' package.json
}

# ADICIONANDO_LINHA_DE_CODIGO_PARA_EXECUCAO_INICIAL
