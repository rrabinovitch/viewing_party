RSpec.describe 'As an authenticated user' do
  before :each do
    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'When I visit the movie\'s detail page, I should see a button to create a viewing party, and I should see the following info:
  - movie title
  - vote avg
  - runtime in hours and minutes
  - genre(s) for movie
  - summary description
  - first 10 cast members (characters + actors/actresses)
  - count of total reviews
  - each review author and info' do

  visit discover_path
  click_on "Find Top Rated Movies"
  expect(current_path).to eq(movies_path)

  find('.movie-title', match: :first).click
  expect(current_path).to eq(movies_detail_path)
  # Should we be mocking an api object (movie) for these?
  # Otherwise we are relying on what the API call returns for testing.
  # Refactor movies#index first.
  end
end
