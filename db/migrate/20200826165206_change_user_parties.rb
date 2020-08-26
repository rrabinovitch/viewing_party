class ChangeUserParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_parties, :host_id
    add_column :user_parties, :is_host, :boolean, default: false
  end
end
