RSpec.describe User do
  describe 'relationships' do
    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'instance methods' do
    it '#parties' do
      VCR.use_cassette('find_dickie_roberts_by_id') do
        user = User.create(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')
        party1 = Party.create!(movie_id: 13778, duration: 200, date: "2020-08-28")
        party2 = Party.create!(movie_id: 13778, duration: 100, date: "2020-08-30")
        up1 = UserParty.create(party_id: party1.id, attendee_id: user.id, is_host: true)
        up2 = UserParty.create(party_id: party2.id, attendee_id: user.id, is_host: false)

        expect(user.parties.class).to eq(Array)
        expect(user.parties.count).to eq(2)

        user.parties.each do |party|
          expect(party.class).to eq(Party)
        end 
      end
    end
  end
end
