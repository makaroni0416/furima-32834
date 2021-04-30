class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, shipping: '--' },
    { id: 2, shipping: '1~2日で発送' },
    { id: 3, shipping: '2~3日で発送' },
    { id: 4, shipping: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :displays
end
