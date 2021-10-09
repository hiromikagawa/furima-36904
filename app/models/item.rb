class Item < ApplicationRecord

  belongs_to:user
  extend ActiveHash::Associons::ActiveRecordExtensions
  belongs_to:category
  belongs_to:day
  belongs_to:postage
  belongs_to:region
  belongs_to:status
  has_one_attached :image

  validates :name, :text, :prise, presence:true
  validates :category, :status, :postage, :region, :day, numericality: { other_than: 1 } 
end
