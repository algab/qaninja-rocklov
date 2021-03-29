describe "POST /equipos" do
  context "new equipo" do
    before(:all) do
      payload = { email: "alvaro_api@email.com", password: "12345678" }            
      result = Sessions.new.login(payload)
      @user_id = result.parsed_response["_id"]
    end

    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("kramer.jpg"),
        name: "Kramer",
        category: "Cordas",
        price: 299
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)
      @result = Equipos.new.create(payload, @user_id)
    end
        
    it "valid status code 200" do
      expect(@result.code).to eql 200
    end
  end

  context "unauthorized" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("baixo.jpg"),
        name: "Contra Baixo",
        category: "Cordas",
        price: 59
      }

      @result = Equipos.new.create(payload, nil)
    end
        
    it "valid status code 401" do
      expect(@result.code).to eql 401
    end
  end
end
