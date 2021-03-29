#encoding: utf-8

describe "DELETE /equipos/{equipo_id}" do
  before(:all) do
    payload = { email: "alvaro_api@email.com", password: "12345678" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  
  context "get equipo" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("pedais.jpg"),
        name: "Pedais",
        category: "Áudio e Tecnologia".force_encoding("ASCII-8BIT"),
        price: 199
      }

      @equipo = Equipos.new.create(payload, @user_id).parsed_response
      @result = Equipos.new.remove_by_id(@equipo["_id"], @user_id)
    end
        
    it "valid status code 204" do
      expect(@result.code).to eql 204
    end
  end

  context "equipo not found" do
    before(:all) do
      @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)
    end
        
    it "valid status code 204" do
      expect(@result.code).to eql 204
    end
  end
end
