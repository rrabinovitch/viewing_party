class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'
  has_many :attendees, through: :user_parties
end
