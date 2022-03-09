class User < ApplicationRecord
  has_one_attached :avatar

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :first_name,
            length: { 
              minimum: 2,
              maximum: 20
            },
            allow_nil: true

  validates :last_name,
            length: {
              minimum: 2,
              maximum: 20
            },
            allow_nil: true

  has_many :properties
end
