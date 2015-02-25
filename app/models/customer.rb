class Customer < ActiveRecord::Base
	has_secure_password

	validates_confirmation_of :password

	validates_uniqueness_of :email

	validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
	
	has_many :orders

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
end
