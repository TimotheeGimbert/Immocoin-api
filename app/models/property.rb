class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 144 }
  validates :description, presence: true, length: { minimum: 5, maximum: 1000 }
  validates :price, presence: true
  validates :address, presence: true
end
