class Task < ActiveRecord::Base
	belongs_to :user

	validates :title, :description, :reward, presence: true
end
