Dado('que meu perfil de anunciante é {string} e {string}') do |email, password|
  @email = email
  @password = password
end

Dado('que eu tenho o seguinte equipamento cadastrado:') do |table|
  user_id = SessionsService.new.get_user_id(@email, @password)
  
  thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]), "rb")
  
  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco],
  }

  MongoDB.new.remove_equipo(@equipo[:name], @email)
  
  result = EquiposService.new.create(@equipo, user_id)
  @equipo_id = result.parsed_response["_id"]
end

Dado('acesso o meu dashboard') do
  @login_page.open
  @login_page.with(@email, @password)
  expect(@dash_page.on_dash?).to be true
end

Quando('{string} e {string} solicita a locação desse equipo') do |email, password|
  user_id = SessionsService.new.get_user_id(email, password)
  EquiposService.new.booking(@equipo_id,user_id)
end

Então('devo ver a seguinte mensagem:') do |message|
  expect_message = message.gsub("DATA_ATUAL", Time.now.strftime("%d/%m/%Y"))
  expect(@dash_page.order).to have_text expect_message
end

Então('devo ver os links: {string} e {string} no pedido') do |accept, reject|
  expect(@dash_page.order_actions(accept)).to be true
  expect(@dash_page.order_actions(reject)).to be true
end
