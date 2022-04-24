# DevOps - Docker

## Instalação 

> É possivel visualizar a imagem nesse link [DockerHub](https://hub.docker.com/repository/docker/alexandreasr/app-node-docker)
> É possível baixar o código fonte atráves do link [GitHub](https://github.com/Geckkou/DevOps---Docker) 

Para fazer o pull da imagem realize o seguinte comando no terminal

```sh
docker pull alexandreasr/app-node-docker
```

Rode o container.
```sh
docker run -d -p 8080:3000 alexandreasr/app-node-docker:1.0
```
Depois acesse no seu navegador para vizualizar o resultado. 
```sh
http://localhost:8080
```

## Etapas de Desenvolvimento.

### Projeto
- O exercicío foi feito em NodeJs tanto o frontend como backend pela maior simplecidade do desenvolvimento.
- Para requisição do backend foi feito o uso do express como dependencia com a aplicação rodando na porta 3000.
- O Get vai retornar um arquivo HTML.
- O site vai trazer como resultado um site simples para vizualização.

Com o back e front prontos os testes foram feitos com os comando abaixos:

#### Com o código fonte baixado execute o comando no terminal para executar a aplicação.
```sh
node app.js
```
#### Depois acesse para vizualizar.
```sh
http://localhost:3000
```

### Docker
Para a criação da imagem foi feito um Dockerfile baixando a versão 14 do Node.

```sh
FROM node:14
WORKDIR /app-node-docker
EXPOSE 3000
COPY . .
RUN npm install
ENTRYPOINT npm start 
```

#### Com arquivo feito a imagem foi gerada com o build, seguindo a seguinte comando.
```sh 
docker build -t alexandreasr/app-node-docker:1.0 .
```

#### Logo em seguidao container foi gerado.
```sh
docker run -d -p 8080:3000 alexandreasr/app-node-docker:1.0
```

#### Então a tag foi criada e foi feito o push da imagem para o DockerHub
```sh
docker tag alexandreasr/app-node-docker:1.0 alexandreasr/app-node:1.0
docker push alexandreasr/app-node-docker:1.0
```
#### Obs: Precisa ser feito o login no terminal para realizar o push:
```sh
docker login -u <seu dockerhub id>
```

### Problemas durante o desenvolvimento.
Tive dificuldades para subir o container, o docker run rodava mas o container não era iniciado.
Para a solução rodei o seguindo comando para vizulizar os logs do container.
```sh
docker logs <container> -f
```

Então virifiquei que no arquivo 
```sh
${package.json}
Estava faltando: "start": "node ." 
Na parte de scripts para rodar a aplicação no container. 
```