class Followings < ActiveRecord::Base
	belongs_to :user
	belongs_to :follower, class_name: 'User'

	def init
		self.blocked ||= false
	end
end
