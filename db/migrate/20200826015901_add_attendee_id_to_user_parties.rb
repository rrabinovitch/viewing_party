class AddAttendeeIdToUserParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_parties, :attendee, foreign_key: { to_table: :users }
  end
end
