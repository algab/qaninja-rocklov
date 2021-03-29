describe "GET /equipos" do
  before(:all) do
    payload = { email: "to@mate.com", password: "12345678" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "get equipos" do
    before(:all) do
      payloads = [
        {
          thumbnail: Helpers::get_thumb("slash.jpg"),
          name: "Slash",
          category: "Outros",
          price: 399
        },
        {
          thumbnail: Helpers::get_thumb("trompete.jpg"),
          name: "Trompete",
          category: "Outros",
          price: 99
        }
      ]

      payloads.each do |payload|
        MongoDB.new.remove_equipo(payload[:name], @user_id)
        Equipos.new.create(payload, @user_id)
      end
      
      @result = Equipos.new.list(@user_id)
    end
        
    it "valid status code 200" do
      expect(@result.code).to eql 200
    end

    it "valid array" do
      expect(@result.parsed_response).not_to be_empty
    end
  end
end

describe "GET /equipos/{equipo_id}" do
  before(:all) do
    payload = { email: "penelope@email.com", password: "12345678" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end
  
  context "get equipo by id" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("sanfona.jpg"),
        name: "Sanfona",
        category: "Outros",
        price: 499
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)
      @equipo = Equipos.new.create(payload, @user_id).parsed_response
      @result = Equipos.new.find_by_id(@equipo["_id"], @user_id)
    end
        
    it "valid status code 200" do
      expect(@result.code).to eql 200
    end

    it "should return name" do
      expect(@result.parsed_response["name"]).to eql @equipo["name"]
    end
  end

  context "equipo not found" do
    before(:all) do
      @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
    end
        
    it "valid status code 404" do
      expect(@result.code).to eql 404
    end
  end
end
