class RemoveUserIdFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :user_id
  end
end
