describe "POST /signup" do
  context "create new user" do
    before(:all) do
      payload = { name: "Álvaro", email: "alvaro_api@email.com", password: "12345678" }
      MongoDB.new.remove_user(payload[:email])
      @result = Signup.new.create(payload)
    end
        
    it "valid status code" do
      expect(@result.code).to eql 200
    end
    
    it "valid length id" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "user already exists" do
    before(:all) do
      payload = { name: "Teste", email: "teste@email.com", password: "12345678" }
      MongoDB.new.remove_user(payload[:email])
      Signup.new.create(payload)
      @result = Signup.new.create(payload)
    end
        
    it "valid status code 409" do
      expect(@result.code).to eql 409
    end

    it "valid body" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end
end
