FactoryBot.define do
  factory :item_purchase do
    postal_code    {'123-4567'}
    prefecture_id  {11}
    city           {'埼玉県'}
    address        {'向陽台1-1-15'}
    building       {''}
    phoneno        {'08055552121'}
    item_id        {FactoryBot.create(:item).id }
    user_id        {FactoryBot.create(:user).id}
    token          {"tok_abcdefghijk00000000000000000"}

  end

end
