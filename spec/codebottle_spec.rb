require "spec_helper.rb"

describe Codebottle do
  describe "#search" do
    it "returns a maximum of 2 results" do
      result = Codebottle.search(keywords: "test", limit: 2)
      expect(result.results.length).to be <= 2
    end
  end

  describe "#get" do
    it "returns info on snippet '3467598b'" do
      result = Codebottle.get(id: "3467598b")
      expect(result.data["code_id"]).to eq("3467598b")
    end
  end

  describe "#browse" do
    it "returns a maximum of 2 results" do
      result = Codebottle.browse(limit: 2)
      expect(result.results.length).to be <= 2
    end
  end

  describe "#verifysecure" do
    it "raises Codebottle::CodebottleError with message 'Invalid token'" do
      expect { Codebottle.verifysecure(secure_token: "invalid") }.to raise_error(Codebottle::CodebottleError, "Invalid token")
    end
  end

  describe "#getprofile" do
    it "returns information on username 'IndigoTiger'" do
      result = Codebottle.getprofile(username: "IndigoTiger")
      expect(result.profile["username"]).to eq("IndigoTiger")
    end
  end

  describe "#getcodelanguages" do
    it "returns a Hash mapping language IDs to names" do
      result = Codebottle.getcodelanguages()
      expect(result.code_language_names).to be_a(Hash)
    end
  end

  describe "#getcodetypes" do
    it "returns a Hash mapping type IDs to names" do
      result = Codebottle.getcodetypes()
      expect(result.code_type_names).to be_a(Hash)
    end
  end
end
