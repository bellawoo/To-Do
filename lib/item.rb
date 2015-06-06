class Item < ActiveRecord::Base
	belongs_to :lists

	def set_due_date
	end

	def mark_completed
		self.completed = true
		save
	end
end