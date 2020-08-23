RSpec.describe 'user can log in' do
  describe 'using google_oauth2', type: :feature do
    it "user authenticates via Google, and is redirected to their dashboard where they see 'Welcome, <user_email>'" do
      # OmniAuth mock defined in spec_helper.rb
      visit root_path
      click_on "Login"

      expect(page).to have_content("Welcome, gmendez90@gmail.com")
      # expect(page).to have_link("Logout")
    end
  end
end
