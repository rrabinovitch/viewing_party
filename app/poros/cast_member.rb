class CastMember
  attr_reader :name, :character, :id

  def initialize(member_data)
    @id = member_data[:id]
    @name = member_data[:name]
    @character = member_data[:character]
  end
end
