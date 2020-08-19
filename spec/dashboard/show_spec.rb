RSpec.describe 'user can log in' do
  describe 'using google_oauth2' do

    it 'user signs in via Google, and is redirected to their dashboard' do
      #
      OmniAuth.config.mock_auth[:google]
      visit "/"
      click_on "Login"
      expect(page).to have_content("gmendez90@gmail.com")
      # expect(page).to have_link("Logout")
    end
  end
end
