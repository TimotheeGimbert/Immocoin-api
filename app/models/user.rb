class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :first_name, length: { minimum: 2, maximum: 20 }, unless: fisrt_name.nil?
  validates :last_name, length: { minimum: 2, maximum: 20 }, unless: last_name.nil?

  has_many :properties
end
