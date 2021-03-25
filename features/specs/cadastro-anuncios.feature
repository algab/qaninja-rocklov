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

    Esquema do Cenario: Tentativas de cadastro de anúncios
        Dado que acesso o formulário de cadastro de anúncios
        E que eu tenho o seguinte equipamento:
            |thumb    |<foto>     |
            |nome     |<nome>     |
            |categoria|<categoria>|
            |preco    |<preco>    |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
        |foto         |nome           |categoria|preco|saida                               |
        |             |Violao de Nylon|Cordas   |200  |Adicione uma foto no seu anúncio!   |
        |clarinete.jpg|               |Outros   |100  |Informe a descrição do anúncio!     |
        |mic.jpg      |Microfone Shure|         |150  |Informe a categoria                 |
        |trompete.jpg |Trompete       |Outros   |     |Informe o valor da diária           |
        |conga.jpg    |Gonga          |Outros   |abc  |O valor da diária deve ser numérico!|
        |conga.jpg    |Gonga          |Outros   |12a  |O valor da diária deve ser numérico!|
