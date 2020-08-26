class RemoveHostColumnInUserParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_parties, :host_id, :bigint
  end
end
