#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usúario cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para disponibilizá-los para locação

    Contexto: Login
        * Login com "alvaro_teste@email.com" e "12345678"

    Cenario: Novo equipo
        Dado que acesso o formulário de cadastro de anúncios
        E que eu tenho o seguinte equipamento:
            |thumb    |fender-sb.jpg|
            |nome     |Fender Strato|
            |categoria|Cordas       |
            |preco    |200          |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard
