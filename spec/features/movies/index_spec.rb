# movies/index_spec.rb
RSpec.describe 'As an authenticated user' do
  before :each do

    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe 'Movies index page: Top 40 Movies' do
    it 'When I visit the movies page via the "Find Top Rated Movies" button, I should see the 40 results from my search, I should also see the "Find Top Rated Movies" button and the Find Movies form at the top of the page.' do
      VCR.use_cassette('top_forty_movies') do
        visit discover_path
        click_on "Find Top Rated Movies"
        expect(current_path).to eq(movies_path)

        expect(page).to have_selector("#movie_keywords")
        expect(page).to have_button("Find Movies")

        within(".search-results") do
          expect(page).to have_selector(".movie-title", count: 40)
        end
      end
    end

    it 'When I click on a movie title link, I should be redirected to the movie\'s details page' do
      VCR.use_cassette('first_of_top_forty_movies') do
        visit discover_path
        click_on "Find Top Rated Movies"
        expect(current_path).to eq(movies_path)

        find('.movie-title', match: :first).click
        expect(current_path).to eq(movies_detail_path)
      end
    end
  end

  describe 'Movies index page: Keyword search' do
    it 'Search results with one movie' do
      VCR.use_cassette('dickie_roberts_search_results') do
        visit discover_path
        fill_in :movie_keywords, with: "Dickie Roberts"
        click_on "Find Movies"

        expect(current_path).to eq(movies_path)
        within('.search-results') do
          expect(page).to have_selector(".movie-title", count: 1)
        end
      end
    end

    # it 'Keyword search results with 40 results max' do
    # => maybe search w keyword 'hello'?
    # end
  end
end
