FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'hoge12' }
    password_confirmation { 'hoge12' }
    lastname              { '山田' }
    firstname             { '太郎' }
    lastnamekana          { 'ヤマダ' }
    firstnamekana         { 'タロウ' }
    birthdate             { '2021-01-01' }
  end
end
