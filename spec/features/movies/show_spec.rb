RSpec.describe 'As an authenticated user' do
  before :each do
    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # json_response1 = File.read('spec/fixtures/top_rated_movie1.json')
    # json_response2 = File.read('spec/fixtures/top_rated_movie2.json')
    #
    # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=033cf2fe940e095f326c2f128d70fdfa&language=en-US&page=1").
    #   to_return(status: 200, body: json_response1)
    #
    # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=033cf2fe940e095f326c2f128d70fdfa&language=en-US&page=2").
    #   to_return(status: 200, body: json_response2)
  end

  describe 'movie details page' do
    it 'I should see a button to create a viewing party, and I should see the following info:
    - movie title
    - vote avg
    - runtime in hours and minutes
    - genre(s) for movie
    - summary description
    - first 10 cast members (characters + actors/actresses)
    - count of total reviews
    - each review author and info' do

      VCR.use_cassette('first_of_top_forty_movies') do
        visit discover_path
        click_on "Find Top Rated Movies"
        expect(current_path).to eq(movies_path)

        find('.movie-title', match: :first).click
        expect(current_path).to eq(movies_detail_path)
        expect(page).to have_button("New Viewing Party")
        # expect one movie's details here.
      end
    end
  end



end
