class UserPhoto < ActiveRecord::Base
  
  belongs_to :user
  
  scope :have_photo, where('avatar_file_name is not null') 
 
  has_attached_file :avatar, {
    :styles => {
       :medium => ['100x100#', :png], 
       :large => ['1000x1000>', :png]
    }
  }

end
