#!/bin/bash

version=$1

echo -n "Criando a imagem..."
docker build -q -t  cevmdocker-registry.tre-ce.jus.br:5000/scada:$version . >/dev/null

if [ $? -eq 0 ]
then
  echo "[OK]"
else
  echo "Erro. Consulte os logs"
fi

echo -n "Enviando para o registry..."
docker push cevmdocker-registry.tre-ce.jus.br:5000/scada:$version >/dev/null

if [ $? -eq 0 ]
then
  echo "[OK]"
else
  echo "Erro. Consulte os logs"
fi

echo "version=$version" > .env

# push
git add .

git commit -m "New version: $version"

git push origin master
