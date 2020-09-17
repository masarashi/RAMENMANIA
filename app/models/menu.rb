class Menu < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true, length: { maximum: 64 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, length: { maximum: 5 }
  validates :description, length: { maximum: 64 }
end
