FactoryBot.define do
  factory :item do

     name                  { Faker::Name.last_name }
     description           {'テストテストテスト'}
     price                 {400}
     condition_id          {2}
     shipping_id           {2}
     delivery_date_id      {2}
     category_id           {2}
     delivery_area_id      {2}
     association :user

      after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
