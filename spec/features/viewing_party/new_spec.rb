RSpec.describe 'As an authenticated user' do
  before :each do
    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'visit movie details page' do
    it 'When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        visit viewing_parties_new_path({movie_id: 13778})
        expect(page).to have_selector("#movie_title")
        # test that movie title field is un-editable
        expect(page).to have_selector("#party_duration")
        expect(page).to have_selector("#date")
        expect(page).to have_selector("#friends")
        expect(page).to have_button("Create Party")
      end
    end
  end
end

# manually pick id for existing movie
# record cassette for that movie via VCR
