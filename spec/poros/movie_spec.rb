RSpec.describe Movie do
  before :each do
    data = {
    "adult": false,
    "backdrop_path": "/cubZdqcu2VdIBhlLCaJqFStFkO8.jpg",
    "belongs_to_collection": "null",
    "budget": 0,
    "genres": [
        {
            "id": 35,
            "name": "Comedy"
        }
    ],
    "homepage": "",
    "id": 13778,
    "imdb_id": "tt0325258",
    "original_language": "en",
    "original_title": "Dickie Roberts: Former Child Star",
    "overview": "TV child star of the '70s, Dickie Roberts is now 35 and parking cars. Craving to regain the spotlight, he auditions for a role of a normal guy, but the director quickly sees he is anything but normal. Desperate to win the part, Dickie hires a family to help him replay his childhood and assume the identity of an average, everyday kid.",
    "popularity": 12.6,
    "poster_path": "/6dgCPSVEEMU2BLvxOzBAvkQjIeL.jpg",
    "production_companies": [
        {
            "id": 2608,
            "logo_path": "/g3YRudXiQzHesQqRXvnhFpMzfkU.png",
            "name": "Happy Madison Productions",
            "origin_country": "US"
        },
        {
            "id": 4,
            "logo_path": "/fycMZt242LVjagMByZOLUGbCvv3.png",
            "name": "Paramount",
            "origin_country": "US"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "US",
            "name": "United States of America"
        }
    ],
    "release_date": "2003-09-05",
    "revenue": 0,
    "runtime": 98,
    "spoken_languages": [
        {
            "iso_639_1": "en",
            "name": "English"
        }
    ],
    "status": "Released",
    "tagline": "50 million people used to watch him on TV. Now he washes their cars.",
    "title": "Dickie Roberts: Former Child Star",
    "video": false,
    "vote_average": 5.1,
    "vote_count": 130
}

    @movie = Movie.new(data)
  end

  it 'Can create a Movie object from json hash with attributes' do

    expect(@movie.id).to eq(13778)
    expect(@movie.title).to eq("Dickie Roberts: Former Child Star")
    expect(@movie.vote_avg).to eq(5.1)
    expect(@movie.summary).to eq("TV child star of the '70s, Dickie Roberts is now 35 and parking cars. Craving to regain the spotlight, he auditions for a role of a normal guy, but the director quickly sees he is anything but normal. Desperate to win the part, Dickie hires a family to help him replay his childhood and assume the identity of an average, everyday kid.")
    expect(@movie.genres.class).to eq(Array)
    expect(@movie.runtime).to eq(98)
  end

  it '#first_ten_cast_members' do
    VCR.use_cassette('get_cast_members_dickie_roberts') do
      expect(@movie.first_ten_cast_members.count).to eq(10)
      @movie.first_ten_cast_members.each do |cast_member|
        expect(cast_member.class).to eq(CastMember)
      end
    end
  end

  it '#reviews' do
    VCR.use_cassette('get_reviews_dickie_roberts') do
      expect(@movie.reviews.count).to eq(0)
    end
  end
end
