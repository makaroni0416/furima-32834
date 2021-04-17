class Display < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :product_status
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
  validates :product             
  validates :product_text        
  end

  with_options presence: true, numericality: { other_than: 1 } do
  validates :category_id         
  validates :product_status_id   
  validates :delivery_price_id    
  validates :prefecture_id        
  validates :shipping_date_id   
  end 


  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字のみ入力してください' } do  
  validates_inclusion_of :price, in: 300..9_999_999
  end

  def was_attached?
    self.image.was_attached?
  end

end



