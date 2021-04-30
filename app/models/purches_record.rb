class PurchesRecord < ApplicationRecord
  has_one :address
  belongs_to :user
  belongs_to :display
end
