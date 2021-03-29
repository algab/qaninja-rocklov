describe "POST /sessions" do
  context "login successful" do
    before(:all) do
      payload = { email: "to@mate.com", password: "12345678" }
      @result = Sessions.new.login(payload)
    end
        
    it "valid status code" do
      expect(@result.code).to eql 200
    end
    
    it "valid length id" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  examples = Helpers::get_fixture("login")

  examples.each do |example|
    context "#{example[:title]}" do
      before(:all) do
        @result = Sessions.new.login(example[:payload])
      end
            
      it "valid status code #{example[:code]}" do
        expect(@result.code).to eql example[:code]
      end
        
      it "valid body" do
        expect(@result.parsed_response["error"]).to eql example[:error]
      end
    end
  end
end
