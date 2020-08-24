RSpec.describe 'As an authenticated user' do
  before :each do
    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'visit movie details page' do
    it 'When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('first_of_top_forty_movies') do
        visit discover_path
        click_on "Find Top Rated Movies"
        find('.movie-title', match: :first).click
        click_on "New Viewing Party"
        expect(current_path).to eq(viewing_parties_new_path)
      end
      # expect one movie's details here.
    end
  end
end
