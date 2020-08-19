RSpec.describe 'user can log in' do
  describe 'using google_oauth2' do

    # a method for omniauth test stub:
    def stub_omniauth
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
        # what goes in this hash?
        provider: "google",
        uid: "12345678910",
        info: {
          email: "jesse@mountainmantechnologies.com",
          first_name: "Jesse",
          last_name: "Spevack"
        },
        credentials: {
          token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now,
        }
      })
    end

    it 'user signs in via Google, and is redirected to their dashboard' do
      #
      stub_omniauth
      visit "/"
      click_on "Login"
      expect(page).to have_content("Gaby Mendez")
      # expect(page).to have_link("Logout")
    end
  end
end
