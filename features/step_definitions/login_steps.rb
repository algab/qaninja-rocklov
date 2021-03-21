Dado('que acesso a página principal') do
    visit "http://rocklov-web:3000"
end
  
Quando('submeto minhas credenciais válidas com {string} e {string}') do |email, password|
    find("input[placeholder='Seu e-email']").set email
    find("input[type=password]").set password

    click_button "Entrar"
end
