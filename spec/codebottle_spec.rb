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
end
