source ./1-gitignore.sh  #GIT_IGNORE
source ./2-initial_project_node.sh #INICIANDO_PROJETO_NODE
source ./3-structure_folders.sh #ESTRUTURA_DE_PASTAS
source ./4-install_frame_work_express.sh # INSTALANDO_FRAMEWORK_EXPRESS
source ./5-install_lint_rules-trybe.sh # INSTALANDO_LINT
source ./6-files_initial_app_server.sh # LOTE_EXECUTE
source ./7-adding_line_config_package_json.sh # ADICIONANDO_LINHAS_DE_CONFIGURACOS_PACKAGE_JSON
source ./8-install_nodemon.sh # INSTALANDO_NODENOM
source ./9-overwrite_key_main_package_json.sh # ADICIONANDO_LINHA_DE_CODIGO_PARA_EXECUCAO_INICIAL
source ./10-create_index_hello.sh # CRIANDO_ARQUIVO_INDEX_HTML
source ./11-ESTRUTURA_TEST.sh #CRIANDO_ESTRUTURA_TESTE_MOCHA
source ./12-install-mocha-chai.sh # INSTALL_MOCHA_CHAI
source ./13-install-morgan.sh # INSTALL_MORGAN
source ./14-install-middlewaere-error.sh #INSTALANDO_EXPRESS_MIDDLEWARE_ERROR


TIME(){
  echo '---------------'
  echo 'Executing in 1s'
  echo '---------------'
  sleep 1
  echo '---------------'
  echo 'Executing in 2s'
  echo '---------------'
  sleep 1
}

EXECUTE(){
  TIME
  echo '---------------'
  echo 'Create gitignore'
  echo '---------------'
  GIT_IGNORE
  TIME
  echo '--------------------'
  echo 'Initial project node'
  echo '--------------------'
  INICIANDO_PROJETO_NODE
  TIME
  echo '-----------------'
  echo 'structure folders'
  echo '-----------------'
  ESTRUTURA_DE_PASTAS
  TIME
  echo '-------------------------'
  echo 'install framework express'
  echo '-------------------------'
  INSTALANDO_FRAMEWORK_EXPRESS
  TIME
  echo '------------'
  echo 'install lint'
  echo '------------'
  INSTALANDO_LINT
  TIME
  echo '--------------------'
  echo 'install dependencies'
  echo '--------------------'
  LOTE_EXECUTE
  TIME
  echo '--------------------'
  echo 'configurations files'
  echo '--------------------'
  ADICIONANDO_LINHAS_DE_CONFIGURACOS_PACKAGE_JSON
  TIME
  echo '--------------------'
  echo 'install nodemon'
  echo '--------------------'
  INSTALANDO_NODENOM
  TIME
  echo '--------------------'
  echo 'instalando morgan'
  echo '-------------------'
  INSTALANDO_MORGAN
  echo '------------------------------'
  echo 'instalando middleware de error'
  echo '------------------------------'
  INSTALANDO_EXPRESS_MIDDLEWARE_ERROR
  TIME
  echo'-----------------------------'
  echo 'Estrutura de Pastras Testing'
  echo '----------------------------'
  CRIANDO_ESTRUTURA_TESTE_MOCHA
  TIME
  echo '-----------------------------'
  echo 'Instalando Mocha e Chai'
  echo '-----------------------------'
  INSTALL_MOCHA_CHAI
  echo '---------------------------'
  echo 'adding code project initial'
  echo '---------------------------'
  ADICIONANDO_LINHA_DE_CODIGO_PARA_EXECUCAO_INICIAL
  npm run kill
  TIME
  echo '---------------------'
  echo 'executing application'
  echo '---------------------'
  npm run dev
}

EXECUTE
