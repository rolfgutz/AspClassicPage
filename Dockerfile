# Use a imagem base do Windows Server Core
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Log 1: Mensagem antes de instalar o IIS
RUN echo "Iniciando a instalação do IIS..."

# Instalar o IIS e o ASP Clássico
RUN powershell -Command \
    Install-WindowsFeature -Name Web-Server,Web-Asp,Web-Common-Http,Web-Static-Content,Web-Http-Redirect; \
    echo "IIS instalado com sucesso."

# Log 2: Mensagem antes de copiar os arquivos
RUN echo "Copiando arquivos para o diretório do IIS..."

# Criar diretório no IIS para o site
RUN powershell -Command \
    New-Item -Path 'C:\inetpub\wwwroot\site' -ItemType Directory;

# Copiar os arquivos da aplicação para o diretório do IIS
COPY ./site /inetpub/wwwroot/site

# Log 3: Mensagem antes de configurar o IIS
RUN echo "Arquivos copiados. Configurando o IIS..."

# Remover o site existente, se houver, antes de criar o novo
RUN powershell -Command \
    Import-Module WebAdministration; \
    if (Test-Path "IIS:\Sites\AspClassicApp") { \
        Remove-Item "IIS:\Sites\AspClassicApp" -Recurse -Force; \
    }; \
    New-Item -Path "IIS:\Sites\AspClassicApp" -Bindings @{protocol='http';bindingInformation='*:5000:'} -PhysicalPath 'C:\inetpub\wwwroot\site'; \
    Start-WebSite -Name "AspClassicApp"

# Log 4: Mensagem antes de iniciar o IIS
RUN echo "Site configurado. Iniciando IIS..."

# Expor a nova porta 5000
EXPOSE 5000

# Iniciar o IIS e manter o container ativo
CMD ["powershell", "-Command", "Start-Service w3svc; while ($true) { Start-Sleep -Seconds 60 }"]
