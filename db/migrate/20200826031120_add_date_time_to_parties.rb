class AddDateTimeToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :date, :string
    add_column :parties, :time, :string
  end
end
