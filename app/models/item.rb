class Item < ApplicationRecord
  belongs_to :user
  has_one    :sold
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping
    belongs_to :delivery_area
    belongs_to :delivery_date

    with_options presence: true do
     validates :name 
     validates :price, inclusion: { in: (300..9999999)}
     validates :description 
     validates :image
  
      with_options numericality: { other_than: 1 } do
        validates :category_id 
        validates :condition_id 
        validates :shipping_id
        validates :delivery_area_id 
       validates  :delivery_date_id 
       end
    end

end
