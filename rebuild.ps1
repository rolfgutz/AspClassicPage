Write-Host "Parando e removendo o contêiner antigo (se existir)..."
docker stop asp-container 2>$null
docker rm asp-container 2>$null

Write-Host "Liberando porta (se necessária)..."
netstat -ano | findstr :5000 | ForEach-Object {
    $pid = ($_ -split '\s+')[-1]
    if ($pid) {
        Write-Host "Finalizando processo que está usando a porta 5000 (PID: $pid)..."
        Stop-Process -Id $pid -Force
    }
}

Write-Host "Construindo a nova imagem..."
docker build -t asp-classic-app .

Write-Host "Iniciando o novo contêiner..."
docker run -d -p 5000:5000 --name asp-container asp-classic-app

Write-Host "Processo concluído! O contêiner está rodando na porta 5000."
