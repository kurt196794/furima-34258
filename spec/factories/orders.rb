FactoryBot.define do
  factory :order do

    postal_code { "123-4567" }
    municipalities { '富士見市' }
    address { '1' }
    building_name { 'むつみ荘' }
    phone_number { "12345678912" }
    delivery_area_id{2}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
