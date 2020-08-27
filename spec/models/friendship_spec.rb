RSpec.describe Friendship do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :friend }
  end

  describe 'class method' do
    it '::create_reciprocal_friendship' do

      gaby = User.create(user_id: '7777', username: 'gaby@gmail.com', token: '1234gaby', refresh_token: 'gaby1234')
      ruthie = User.create(user_id: '8888', username: 'ruthie@gmail.com', token: '1234ruthie', refresh_token: 'ruthie1234')

      expect(Friendship.all.count).to eq(0)
      
      Friendship.create_reciprocal_friendship(gaby.id, ruthie.id)
      expect(Friendship.all.count).to eq(2)
    end
  end
end
