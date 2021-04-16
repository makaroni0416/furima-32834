class Display < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image

  validates :product,             presence: true
  validates :product_text,        presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1 } 
  validates :product_status_id,   presence: true
  validates :delivery_price_id,   presence: true
  validates :prefecture_id,       presence: true
  validates :shipping_date_id,    presence: true
  validates :price,               presence: true

  def was_attached?
    self.image.was_attached?
  end


end
