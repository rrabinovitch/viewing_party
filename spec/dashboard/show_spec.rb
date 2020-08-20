RSpec.describe 'user can log in' do
  describe 'using google_oauth2', type: :feature do

    it 'user authenticates via Google, and is redirected to their dashboard where they see Welcome, user_email' do
      #
      visit root_path
      click_on "Login"
      # need to implement current user or something so that we can show info.
      expect(page).to have_content("Welcome, gmendez90@gmail.com")
      # expect(page).to have_link("Logout")
    end
  end
end
