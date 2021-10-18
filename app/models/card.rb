class Card < ApplicationRecord
  belongs_to :item
  has_one :delivery
  belongs_to :user, optional: true
end
