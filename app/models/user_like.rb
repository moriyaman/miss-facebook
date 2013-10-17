class UserLike < ActiveRecord::Base

  belongs_to :user
  belongs_to :to_user, :foreign_key => :to_user_id, :class_name => 'User'

end
