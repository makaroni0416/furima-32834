class Order < ApplicationRecord
 include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :display_id, :user_id, :token

  with_options presence: true do
  
    validates       :postcode,      format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates       :prefecture_id, numericality: { other_than: 1 }
    validates       :city,          format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
    validates       :phone_number,  numericality: { with: /\A[0-9]+\z/, message: '半角数字のみ入力してください' }
  end

  with_options presence: true do
   validates       :block
   validates       :token
  end

  def save
    purches_record = PurchesRecord.create(display_id: display_id, user_id: user_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city,block: block, building: building, phone_number: phone_number, purches_record_id: purches_record.id)
  end

end