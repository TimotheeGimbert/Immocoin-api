class Property < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 144 }
  validates :description, presence: true, length: { maximum: 1000 }
end
