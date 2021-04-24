class Address < ApplicationRecord
  class Address < ApplicationRecord
    belongs_to :purches_record
  
    with_options presence: true do
  
      validates       :postcode,      format: { with: /^\d{3}[-]\d{4}$/, message: '半角数字のみ、ハイフンを入れて7文字で入力してください' }
      validates       :prefecture_id, numericality: { other_than: 1 }
      validates       :city,          format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
      validates       :block
      validates       :building
      validates       :phone_number,  format: { with: /\A[0-9]+\z/, message: '半角数字のみ入力してください' }
    end
  
  end
  
end
