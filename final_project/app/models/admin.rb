class Admin < ApplicationRecord
  belongs_to :organization

  def admin_since
  	self.created_at.strftime("Admin since %m/%d/%Y ")
  end

 	def ban_user(user_id)
 		user = User.find_by(id: user_id)
 		user.banned = true
 	end

	def unban_user(user_id)
 		user = User.find_by(id: user_id)
 		user.banned = false
 	end


 	def users
 		self.organization.users
 	end

end
