#language: pt

Funcionalidade: Login

    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais

    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais válidas com "alvaro_web@email.com" e "12345678"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentativa de Login
        Dado que acesso a página principal
        Quando submeto minhas credenciais válidas com "<email>" e "<senha>"
        Então vejo a mensagem de alerta: "<mensagem>"

        Exemplos:
        |email                 |senha   |mensagem                         |
        |alvaro_teste@email.com|1234    |Usuário e/ou senha inválidos.    |
        |teste@email.com       |12345678|Usuário e/ou senha inválidos.    |
        |alvaro&email          |12345678|Oops. Informe um email válido!   |
        |                      |12345678|Oops. Informe um email válido!   |
        |alvaro_teste@email.com|        |Oops. Informe sua senha secreta! |
