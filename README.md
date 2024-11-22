
# ASP Classic App

Bem-vindo ao repositório do projeto ASP Classic! Este projeto utiliza Docker para facilitar o desenvolvimento e a execução da aplicação. Abaixo, você encontrará todas as informações necessárias para configurar, construir e executar o projeto.

## Tabelas de Conteúdos
- [Comandos do Docker](#comandos-do-docker)
- [Iniciar o Projeto](#iniciar-o-projeto)
- [Manutenção e Limpeza](#manutenção-e-limpeza)
- [Referências](#referências)

## Comandos do Docker

### 1. **Construir a Imagem**
Sempre que você fizer qualquer alteração no código ou no `Dockerfile`, será necessário reconstruir a imagem Docker. Utilize o comando abaixo para isso:

```bash
docker build -t asp-classic-app .
```

Esse comando cria a imagem com o nome `asp-classic-app`, que será usada para executar os contêineres.

### 2. **Criar o Contêiner**
Após construir a imagem, crie e inicie um contêiner em segundo plano, mapeando a porta 8080 no seu host para a porta 80 no contêiner. Para isso, execute:

```bash
docker run -d -p 5000:5000 --name asp-container asp-classic-app
```

Este comando cria o contêiner com o nome `asp-container` e inicia a aplicação, acessível em `http://localhost:5000`.

### 3. **Parar o Contêiner**
Caso precise parar o contêiner em execução, utilize o comando abaixo. Para identificar o ID do contêiner, execute `docker ps`:

```bash
docker stop <container_id>
```

Exemplo:

```bash
docker stop 7bf411abdd99
```

### 4. **Remover o Contêiner**
Após parar o contêiner, você pode removê-lo utilizando o seguinte comando:

```bash
docker rm <container_id>
```

Exemplo:

```bash
docker rm 7bf411abdd99
```

### 5. **Remover Imagens e Contêineres Não Utilizados**
Para manter o sistema limpo e sem excesso de arquivos, é importante remover imagens e contêineres antigos que não são mais necessários.

- Para remover todas as imagens não utilizadas:

```bash
docker image prune -a
```

- Para remover todos os contêineres que estão parados:

```bash
docker container prune
```

### 6. **Verificar Contêineres em Execução**
Para verificar quais contêineres estão em execução, utilize:

```bash
docker ps
```

Este comando exibe a lista de contêineres ativos no momento.

## Iniciar o Projeto

Siga as etapas abaixo para configurar o ambiente e iniciar o projeto localmente.

1. **Clone o repositório** para sua máquina local:

```bash
git clone https://seurepositorio.git
cd nome-do-repositorio
```

2. **Certifique-se de que o Docker esteja instalado** em sua máquina. Caso não tenha, siga [este link](https://docs.docker.com/get-docker/) para instalar o Docker.

3. **Construir a imagem Docker**. Após realizar qualquer alteração no código, execute o comando de build:

```bash
docker build -t asp-classic-app .
```

4. **Criar e executar o contêiner**. Após construir a imagem, execute o seguinte comando para criar o contêiner e rodar a aplicação:

```bash
docker run -d -p 8080:80 --name asp-container asp-classic-app
```

5. **Acessar a aplicação**: Abra o navegador e vá para `http://localhost:5000` para ver a aplicação rodando.

## Manutenção e Limpeza

### Rebuild da Imagem
Sempre que você modificar o código ou o `Dockerfile`, não se esqueça de reconstruir a imagem com o comando:

```bash
docker build -t asp-classic-app .
```

### Parar e Remover Contêineres
Quando não precisar mais de um contêiner em execução, utilize:

```bash
docker stop <container_id>
docker rm <container_id>
```

### Limpeza de Imagens e Contêineres Antigos
Para remover imagens e contêineres não utilizados, utilize:

- **Remover imagens antigas**:

```bash
docker image prune -a
```

- **Remover contêineres parados**:

```bash
docker container prune
```

Esses comandos ajudam a manter o ambiente limpo e otimizado.

## Referências
- [Documentação Oficial do Docker](https://docs.docker.com/)
- [Tutorial de Docker para Iniciantes](https://www.digitalocean.com/community/tutorials)

---

Esse é o guia completo para trabalhar com Docker neste projeto. Se tiver algum problema ou dúvida, consulte as referências ou entre em contato com a equipe de suporte.
