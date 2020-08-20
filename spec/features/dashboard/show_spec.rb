RSpec.describe 'dashboard show page' do
  describe 'after logging in', type: :feature do
    before :each do
      visit root_path
      click_on "Login"
    end

    it "the dashboard has a 'Discover Movies' button that redirects me to a discover page" do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"
      expect(current_path).to eq(discover_path)
    end

    it "the dashboard has a 'Friends' section" do
      expect(page).to have_css(".friends") # repetetive but including this until the rest of the section is built out
      within(".friends") do
        # expect(page).to have_field("#friend-email")
        # expect(page).to have_button("Add Friend")
        expect(page).to have_content("You currently have no friends.")
      end
    end

    it "the dashboard has a 'Viewing Parties' section" do
      expect(page).to have_css(".viewing-parties") # repetetive but including this until the rest of the section is built out
      within(".viewing-parties") do
        expect(page).to have_content("You have no viewing parties coming up.")
      end
    end
  end
end
