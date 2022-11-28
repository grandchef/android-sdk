# GrandChef - Android SDK com Node.js 14.x
Imagem base para build de aplicação android.

## Build

Criar imagem base
```sh
docker build -t {repository_name}:{sdk_version}-nodejs-ruby .
```

Roda o shell na imagem criada
```sh
docker run -it --rm {repository_name}:{sdk_version}-nodejs-ruby /bin/bash
```

## Release

Envia imagem para o hub.docker
```sh
docker push {repository_name}:{sdk_version}-nodejs-ruby
```
