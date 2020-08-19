RSpec.describe 'user can log in' do
  describe 'using google_oauth2' do

    it 'user signs in via Google, and is redirected to their dashboard' do
      #
      OmniAuth.config.mock_auth[:google]
      visit "/"
      click_on "Login"
      # need to implement current user or something so that we can show info.
      expect(page).to have_content("gmendez90@gmail.com")
      expect(page).to have_content("Dashboard")
      # expect(page).to have_link("Logout")
    end
  end
end
