RSpec.describe 'dashboard show page' do
  describe 'after logging in', type: :feature do
    before :each do
      visit root_path
      click_on "Login"
      existing_user_attributes = {}
      @existing_user = User.create!()
    end

    it "the dashboard has a 'Discover Movies' button that redirects me to a discover page" do
      expect(page).to have_button("Discover Movies")
      click_button "Discover Movies"
      expect(current_path).to eq(discover_path)
    end

    it "the dashboard has a 'Friends' section with a 'no friends' message if I haven't added any friends" do
      expect(page).to have_css(".friends") # repetetive but including this until the rest of the section is built out
      within(".friends") do
        # alternative field name: friend_search_field ?
        expect(page).to have_field("#friend-email")
        expect(page).to have_button("Add Friend")
        expect(page).to have_content("You currently have no friends.")
      end
    end

    it "when I enter a friend's email associated with another existing user, they are added
      to my friends list, which displays their email" do
      # confirm whether user stories specify *what* details should be displayed for each friend

      # create a stub for existing user??
      existing_user = "ruthie@gmail.com"
      within(".friends") do
        expect(page).to_not have_content(existing_user)
        fill_in :friend_email, with: existing_user
        click_button "Add Friend"
      end

      expect(current_path).to eq(dashboard_path)
      # if we use a partial to have the flash message appear within the friends section instead
      # of at the top of the page, this expectation can be moved into the within(".friends") block below
      expect(page).to have_content("You have added #{existing_user} as a friend.")

      within(".friends") do
        expect(page).to have_content(friend_email)
      end
    end

    it "when I enter an email not associated with an existing user, I see an error message indicating
      that the user does not exist" do
      nonexistant_user = "noodle@gmail.com"
      within(".friends") do
        fill_in :friend_email, with: nonexistant_user
        click_button "Add Friend"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("#{nonexistant_user} does not exist.")
    end

    it "the dashboard has a 'Viewing Parties' section" do
      expect(page).to have_css(".viewing-parties") # repetetive but including this until the rest of the section is built out
      within(".viewing-parties") do
        expect(page).to have_content("You have no viewing parties coming up.")
      end
    end
  end
end
