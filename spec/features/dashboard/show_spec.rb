RSpec.describe 'user can log in' do
  describe 'using google_oauth2', type: :feature do
    before :each do
      visit root_path
    end

    it "user authenticates via Google, and is redirected to their dashboard where they see 'Welcome, <user_email>'" do
      #
      click_on "Login"

      expect(page).to have_content("Welcome, gmendez90@gmail.com")
      # expect(page).to have_link("Logout")
    end

    it "the dashboard has a 'Discover Movies' button" do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"
      # expect(current_path).to eq()
    end

    it "the dashboard has a 'Friends' section" do
      expect(page).to have_css(".friends") # repetetive but including this until the rest of the section is built out
      within(".friends") do
        # expect(page).to have_field("#friend-email")
        expect(page).to have_button("Add Friend")
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
