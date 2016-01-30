class Course < ActiveRecord::Base
	belongs_to :user
	has_many :sections
	has_many :enrollments
	mount_uploader :image, ImageUploader

	validates :title, :presence => {:message => "Title is straightforward for students"}
	validates :description, :presence => {:message => "Let students get quick knowledge about this course"}
	validates :cost, numericality: {greater_than_or_equal_to: 0, :message => "negative is a horrible story"}

	def free?
		cost.zero?
	end

	def premium?
		! free?
	end
end