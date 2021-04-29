class PurchesRecord < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :display
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
  
    validates       :postcode,      format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates       :prefecture_id, numericality: { other_than: 1 }
    validates       :city,          format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
    validates       :phone_number,  numericality: { with: /\A[0-9]+\z/, message: '半角数字のみ入力してください' }
  end

  with_options presence: true do
   validates       :block
   validates       :building
  end

  def save
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city,block: block, building: building, phone_number: phone_number,)
    Purches_record.create()
  end

end
