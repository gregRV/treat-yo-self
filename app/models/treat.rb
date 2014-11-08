class Treat < ActiveRecord::Base
	belongs_to :user

	validates :title, :description, :price, presence: true
end
