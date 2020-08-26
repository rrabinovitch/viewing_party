class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.belongs_to :party, foreign_key: true
      t.belongs_to :host

      t.timestamps
    end
  end
end
