class User < ApplicationRecord
  has_secure_password
  has_many :rentals , dependent: :destroy
  validates :firstName ,presence: true
  validates :lastName ,presence: true
  validates :password ,presence: true
  validates :email ,presence: true , uniqueness: true
  

end
