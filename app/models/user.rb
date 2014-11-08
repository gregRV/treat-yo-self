class User < ActiveRecord::Base
	validates :name, :email, presence: true
	validates :email, uniqueness: true

	has_many :tasks
	has_many :treats

	has_secure_password
end
