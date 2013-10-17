class UserImpression < ActiveRecord::Base

  scope :user_id_is, ->user_id{where(user_id: user_id)}

end
