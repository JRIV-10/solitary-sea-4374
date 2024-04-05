require "rails_helper"

RSpec.describe SearchFacade do
  describe "#initialize" do 
    it "exists" do 
      facade = SearchFacade.new("Fire Nation")

      expect(facade).to be_a(SearchFacade)
    end
  end

  describe "#nations_search" do 
    it "can search for specific nations" do 
      json_response = File.read("spec/fixtures/nations/all_nations.json") # Sample JSON response
      stub_request(:get, "http://last-airbender-api.fly.dev/api/v1/characters?affiliation=%7B:search_params=%3E%7B:nation=%3E%22Fire%20Nation%22%7D%7D").
        to_return(status: 200, body: json_response)

      facade = SearchFacade.new(search_params: { nation: 'Fire Nation' })
      nations = facade.nations_search

      expect(nations).to all(be_a(Nation))
    end
  end 
end