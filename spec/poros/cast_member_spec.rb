RSpec.describe CastMember do
  before :each do
    data = {
            "cast_id": 3,
            "character": "Andy Dufresne",
            "credit_id": "52fe4231c3a36847f800b131",
            "gender": 2,
            "id": 504,
            "name": "Tim Robbins",
            "order": 0,
            "profile_path": "/hsCu1JUzQQ4pl7uFxAVFLOs9yHh.jpg"
        }

    @member = CastMember.new(data)
  end

  it 'Can create a CastMember object from json hash with attributes' do
      expect(@member.id).to eq(504)
      expect(@member.name).to eq("Tim Robbins")
      expect(@member.character).to eq("Andy Dufresne")
  end
end
