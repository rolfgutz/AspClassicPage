<%@ Language="VBScript" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASP Clássico no Docker</title>
    <style>
        /* Definindo o estilo para o body */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        /* Estilo para o cabeçalho */
        h1, h2 {
            color: #333;
        }

        /* Botões com estilo */
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Estilo para os parágrafos */
        p {
            font-size: 18px;
            color: #666;
        }

        /* Estilo para o formulário */
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px auto;
        }

        form label {
            font-size: 16px;
            color: #333;
        }

        form input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script type="text/javascript">
        // Função para exibir uma saudação interativa
        function saudacaoInterativa() {
            var nome = prompt("Qual é o seu nome?");
            if (nome != null && nome != "") {
                alert("Bem-vindo, " + nome + "!");
            } else {
                alert("Você não forneceu um nome.");
            }
        }

        // Função para atualizar a hora sem recarregar a página
        function atualizarHora() {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'hora.asp', true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    document.getElementById('horaAtual').innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
    <h1>Bem-vindo ao ASP Clássico no Docker!</h1>
    <h2>Atualizando Arquivo via rebuild com validação agora</h2>

    <p>Data e hora atuais:</p>
    <p id="horaAtual">
        <%
            ' Exibe a data e hora atual no formato padrão
            Response.Write("Agora é: " & Now())
        %>
    </p>

    <button onclick="saudacaoInterativa()">Clique para uma saudação interativa</button>

    <br><br>
    <button onclick="atualizarHora()">Atualizar Hora sem Recarregar a Página</button>

    <!-- Formulário centralizado -->
    <div>
        <h3>Formulário para envio de dados:</h3>
        <form method="post" action="processa_form.asp">
            <label for="nome">Seu nome:</label>
            <input type="text" id="nome" name="nome">
            <br><br>
            <input type="submit" value="Enviar">
        </form>
    </div>
</body>
</html>
