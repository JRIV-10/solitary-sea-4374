require "rails_helper"

RSpec.describe SearchService do
  describe "#conn" do 
    it "provides a connection to the api" do 
      service = SearchService.new 

      expect(service.conn).to be_a(Faraday::Connection)
    end
  end 

  describe "#get_url(url)" do 
    it "can get a url" do 
      json_response = File.read("spec/fixtures/nations/all_nations.json") # Sample JSON response
      stub_request(:get, "http://last-airbender-api.fly.dev/api/v1/characters?affiliation=%7B:search_params=%3E%7B:nation=%3E%22Fire%20Nation%22%7D%7D").
        to_return(status: 200, body: json_response)

      service = SearchService.new 

      expect(service.get_url("/api/v1/characters?affiliation=%7B:search_params=%3E%7B:nation=%3E%22Fire%20Nation%22%7D%7D")).to be_a(Array)
      expect(service.get_url("/api/v1/characters?affiliation=%7B:search_params=%3E%7B:nation=%3E%22Fire%20Nation%22%7D%7D").first).to have_key :name
      expect(service.get_url("/api/v1/characters?affiliation=%7B:search_params=%3E%7B:nation=%3E%22Fire%20Nation%22%7D%7D").first).to have_key :affiliation
    end
  end 
end