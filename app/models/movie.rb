class Movie < ApplicationRecord
	validates :title ,presence: true
	validates :genre ,presence: true
	validates :duration ,presence: true
	validates :year ,presence: true
	has_many :rentals , dependent: :destroy
end
