CRIANDO_ARQUIVO_INDEX_HTML(){
cd src
rm -rf index.html
touch index.html
cat << EOF > index.html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hello World Index.html</title>
</head>

<body style="background-color: black;">
  <h1 style="color:peru ;">Hello World in Route \index</h1>
  <h2 style="color: wheat;">Dev: Tonis Torres</h2>
</body>

</html>
EOF
}

# CRIANDO_ARQUIVO_INDEX_HTML
