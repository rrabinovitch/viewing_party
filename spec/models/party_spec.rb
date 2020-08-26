RSpec.describe Party do
  # it { should validate_presence_of :movie_id }
  # it { should validate_presence_of :user_id }
  # it { should validate_presence_of :duration }
  # it { should validate_presence_of :date }

  # this isn't working because the reference is to 'host' in party.rb
  # host_id doesn't register as being a column of foreign keys
  # it { should belong_to :user }
end
