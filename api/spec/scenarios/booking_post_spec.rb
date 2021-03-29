describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "ed@email.com", password: "12345678" }            
    result = Sessions.new.login(payload)
    @ed_id = result.parsed_response["_id"]
  end

  context "request rental" do
    before(:all) do
      result = Sessions.new.login({ email: "joe@email.com", password: "12345678" })
      joe_id = result.parsed_response["_id"]
      
      fender = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender Strato",
        category: "Cordas",
        price: 199
      }

      MongoDB.new.remove_equipo(fender[:name], joe_id)
      result = Equipos.new.create(fender, joe_id)
      fender_id = result.parsed_response["_id"]

      @result = Equipos.new.booking(fender_id, @ed_id)
    end
        
    it "valid status code 200" do
      expect(@result.code).to eql 200
    end
  end
end
