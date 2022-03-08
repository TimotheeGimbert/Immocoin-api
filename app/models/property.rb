class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  validates :title,
            presence: true,
            length: {
              minimum: 5,
              maximum: 144
            }

  validates :price,
            presence: true,
            numericality: {
              only_integer: true
            }

  validates :description,
            presence: true,
            length: {
              minimum: 5,
              maximum: 1000
            }

  validates :address,
            presence: true
end
