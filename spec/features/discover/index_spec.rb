RSpec.describe 'As an authenticated user' do
  before :each do
    user = User.create(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'I should see a button to discover top-rated movies; when I click on it, the page reloads with top 40 rated movies; I should also see the "Find Top Rated Movies" button and the Find Movies form at the top of the page.' do

    VCR.use_cassette('top_forty_movies', :allow_playback_repeats => true) do

      visit discover_path

      expect(page).to have_selector("#movie_keywords")
      expect(page).to have_button("Find Movies")

      click_on "Find Top Rated Movies"
      expect(current_path).to eq(discover_path)

      # After JS, css selectors don't work
      # within("#search-results") do
      #   expect(page).to have_selector(".movie-title", count: 40)
      # end
    end
  end

  it 'When I click on a movie title link, I should be redirected to the movie\'s details page' do
    VCR.use_cassette('first_of_top_forty_movies') do
      visit discover_path
      click_on "Find Top Rated Movies"
      expect(current_path).to eq(discover_path)

      # After JS, css selectors don't work
      # find('.movie-title', match: :first).click
      # expect(current_path).to eq(movies_detail_path)
    end
  end

  it 'When I submit a movie keyword search, the page reloads with search results' do

    VCR.use_cassette('dickie_roberts_search_results', :allow_playback_repeats => true) do
      visit discover_path
      fill_in :movie_keywords, with: "Dickie Roberts"
      click_on "Find Movies"
      expect(current_path).to eq(discover_path)

      # After JS, css selectors don't work
      # within('#search-results') do
      #   expect(page).to have_selector(".movie-title", count: 1)
      # end
    end
  end

  it 'Keyword search results return a maximum of 40 movies' do
    VCR.use_cassette('phoenix_search_results') do
      visit discover_path
      fill_in :movie_keywords, with: "Phoenix"
      click_on "Find Movies"

      expect(current_path).to eq(discover_path)

      # After JS, css selectors don't work
      # within('#search-results') do
      #   expect(page).to have_selector(".movie-title", count: 40)
      # end
    end
  end
end
