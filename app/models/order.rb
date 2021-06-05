class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :content, :postal_code, :delivery_area_id, :municipalities, :address, :building_name, :phone_number, :token


    with_options presence: true do
      validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
      validates :municipalities
      validates :address
      validates :phone_number,format:{with: /\A\d{11}\z/}
      validates :delivery_area_id, numericality: {other_than: 1}
      validates :token
    end

 def save
  
  sold = Sold.create(user_id: user_id, item_id: item_id)
  
  Address.create(postal_code: postal_code,delivery_area_id: delivery_area_id,municipalities: municipalities,address: address,building_name: building_name,phone_number: phone_number,sold_id: sold.id)
 end  


end

  