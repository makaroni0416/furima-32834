FactoryBot.define do
  factory :user do
    name                    {Faker::Name.name}
    email                   {Faker::Internet.email}
    birthday                {'2020-02-02'}
    password                = Faker::Internet.password(min_length: 6)
    password                {password}
    password_confirmation   {password}
    family_name             {'ぜんかく'}
    first_name              {'ぜんかく'}
    family_name_kana        {'テストカナ'}
    first_name_kana         {'テストカナ'}
  end
end