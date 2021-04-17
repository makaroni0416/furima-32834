class Display < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  validates :product,             presence: true
  validates :product_text,        presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1 } 
  validates :product_status_id,   presence: true, numericality: { other_than: 1 } 
  validates :delivery_price_id,   presence: true, numericality: { other_than: 1 } 
  validates :prefecture_id,       presence: true, numericality: { other_than: 1 } 
  validates :shipping_date_id,    presence: true, numericality: { other_than: 1 } 

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字のみ入力してください' } do  
  validates_inclusion_of :price, in: 300..9_999_999
  end

  def was_attached?
    self.image.was_attached?
  end


end
