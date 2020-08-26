class UserParty < ApplicationRecord
  belongs_to :host, class_name: 'User'
  belongs_to :attendee, class_name: 'User'
  belongs_to :party
end
