FactoryBot.define do
  factory :item do
    name             {'hoge'}
    text             {Faker::Lorem.sentence}
    category_id      {11}
    status_id        {1}
    paymentmethod_id {1}
    prefecture_id    {12}
    delivery_id      {1}
    price            {7777}
    association :user


     after(:build) do |item|
       item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
     end

  end
end
