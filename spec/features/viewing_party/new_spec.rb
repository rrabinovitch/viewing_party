RSpec.describe 'As an authenticated user' do
  before :each do
    user = User.new(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    # movie = Movie.new(id: 1, title: "Gaby and Ruthie Create an App", vote_avg: 9.9, summary: "So many fun times!", genres: ["Thriller"], runtime: 150)
    # allow_any_instance_of(MoviesController).to receive(:)
  end

  describe 'visit movie details page' do
    it 'When I click the button to create a viewing party, I\'m redirected to a new viewing party form' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        visit viewing_parties_new_path({movie_id: 13778})
        # expect()

      end
      # expect one movie's details here.
      # specify classes in show page and check that css is there (ie not empty)
      # district = find(".district").text
      # expect(district).not_to be_empty
    end
  end
end

# manually pick id for existing movie
# record cassette for that movie via VCR
