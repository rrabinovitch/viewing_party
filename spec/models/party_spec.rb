RSpec.describe Party do
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:attendees).through(:user_parties) }
  end

  describe 'instance methods' do
    it '#movie' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        party = Party.create!(movie_id: 13778, duration: 200, date: "2020-08-28")

        expect(party.movie).to eq("Dickie Roberts: Former Child Star")
      end 
    end
  end
end
