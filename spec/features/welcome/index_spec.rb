RSpec.describe 'As a user' do
  describe 'When I visit the root path' do
    it 'I should see a welcome page with a brief description of the application' do
      #
      visit "/"
      expect(page).to have_content("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    end

    it 'I should see a button to Log In with Google' do
      #
      visit "/"
      expect(page).to have_link("Login")
    end
  end
end
