class Item < ApplicationRecord

  belongs_to:user
  has_one_attached :image

  validates :name, presence:true
  validates :text, presence:true
  validates :image, presence:true

  validates :category_id, presence:true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, presence:true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id,presence:true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, presence:true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, presence:true, numericality: { other_than: 1 , message: "can't be blank"} 

  # with_options presence: true, format: { with: /\A[0-9]+\z/ } do
  validates :prise, presence: true
  validates :prise, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters"}
  validates :prise, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: " is out of setting range" }
  #end 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :day, :postage, :region, :status
 
end
