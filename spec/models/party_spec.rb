RSpec.describe Party do
  # it { should validate_presence_of :movie_id }
  # it { should validate_presence_of :user_id }
  # it { should validate_presence_of :duration }
  # it { should validate_presence_of :date }

  it { should belong_to :user }
end
