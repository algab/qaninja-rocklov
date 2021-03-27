#language: pt

Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro na RockLov
    Para que eu possa disponibilizá-los para locação

    Cenario: Fazer Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            |nome           |email           |senha   |
            |Álvaro Oliveira|alvaro@email.com|12345678|
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentativa de Cadastro
        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            |nome  |email  |senha  |
            |<nome>|<email>|<senha>|
        Então vejo a mensagem de alerta: "<mensagem>"

        Exemplos:
        |nome           |email           |senha   |mensagem                        |
        |               |alvaro@email.com|12345678|Oops. Informe seu nome completo!|
        |Álvaro Oliveira|                |12345678|Oops. Informe um email válido!  |
        |Álvaro Oliveira|alvaro&email    |12345678|Oops. Informe um email válido!  |
        |Álvaro Oliveira|alvaro@email.com|        |Oops. Informe sua senha secreta!|
