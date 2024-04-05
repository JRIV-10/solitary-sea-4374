require "rails_helper"

RSpec.describe "Search by Nation", type: :feature do
  describe "As a user" do
    before do
    end

    it "searches by nation" do
      # When I visit "/"
      visit root_path
      # And I Select "Fire Nation" from the select field
      select "Fire Nation", from: "nation"
      # (Note: Use the existing select field)
      # And I click "Search For Members"
      click_on("Search For Members")
      # Then I should be on page "/search"
      expect(current_path).to eq(search_path)
      # Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
      expect(page).to have_content("Total Number of People in the Fire Nation: 100")
      # And I should see a list with the detailed information for the first 25 members of the Fire Nation.
      
      # And for each of the members I should see:
      # - The name of the member (and their photo, if they have one)
      # - The list of allies or "None"
      # - The list of enemies or "None"
      # - Any affiliations that the member has
    end
  end 
end