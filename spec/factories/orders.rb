FactoryBot.define do
  factory :order do
    token                 {"tok_abcdefghijk00000000000000000"}
    postcode              {"123-4567"}
    prefecture_id         {2}
    city                  {"中央区"}
    block                 {"明石町1-6"}
    building              {"松屋ビル"}
    phone_number          {"09012345678"}
  end
end
