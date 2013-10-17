class UserImpression < ActiveRecord::Base

  belongs_to :user
  belongs_to :to_user, :foreign_key => :to_user_id, :class_name => 'User'
  scope :user_id_is, ->user_id{where(user_id: user_id)}

end
