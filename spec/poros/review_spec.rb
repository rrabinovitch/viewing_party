RSpec.describe Review do
  before :each do
    data = {
            "author": "thommo_nz",
            "content": "There is a reason why this movie is at the top of any popular list your will find.\r\nVery strong performances from lead actors and a story line from the literary brilliance of Stephen King (and no, its not a horror).\r\nSufficient drama and depth to keep you interested and occupied without stupefying your brain. It is the movie that has something for everyone.",
            "id": "5ae800510e0a264fa7000c70",
            "url": "https://www.themoviedb.org/review/5ae800510e0a264fa7000c70"
        }

    @review = Review.new(data)
  end

  it 'Can create a Review object from json hash with attributes' do
      expect(@review.author).to eq("thommo_nz")
      expect(@review.content).to eq("There is a reason why this movie is at the top of any popular list your will find.\r\nVery strong performances from lead actors and a story line from the literary brilliance of Stephen King (and no, its not a horror).\r\nSufficient drama and depth to keep you interested and occupied without stupefying your brain. It is the movie that has something for everyone.")
  end
end
