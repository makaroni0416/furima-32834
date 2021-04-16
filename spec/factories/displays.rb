FactoryBot.define do
  factory :display do
    product                       {'テスト'}
    product_text                  {'ここにテキストを入れます。'}
    category_id                   {2}
    product_status_id             {2}
    delivery_price_id             {2}
    prefecture_id                 {2}
    shipping_date_id              {2}
    price                         {300}
  end

    after(:build) do |display|
      display.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
end
