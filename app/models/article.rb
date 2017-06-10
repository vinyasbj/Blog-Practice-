class Article < ActiveRecord::Base
	belongs_to :category
	has_many :comments

	validates_presence_of :title 
	validates_length_of :title , minimum: 4
	validates_length_of :body , minimum: 10

	validate :check_date

	def check_date
		if !self.publish_date.nil?
			if self.publish_date < Date.today
				self.errors.add(:publish_date, "Article date cannot be yesterdays")
			end
		end
	end
end
