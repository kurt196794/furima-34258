class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one    :sold
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    has_one :category
    has_one :condition
    has_one :shipping
    has_one :delivery_area
    has_one :delivery_date

  with_options presence: true do
    validates :name 
    validates :user
    validates :price, inclusion: { in: (300..9999999)}
    validates :description 
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :shipping_id, numericality: { other_than: 1 } 
    validates :delivery_area_id, numericality: { other_than: 1 } 
    validates :delivery_date_id, numericality: { other_than: 1 } 
  end

end
