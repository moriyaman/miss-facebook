class UserPhoto < ActiveRecord::Base
 
  belongs_to :user

  has_attached_file :photo, {
    :styles => {
       :thumb => ['50x50#', :png], 
       :large => ['500x500#', :png]
    },
    :convert_options => {
      :thumb => "-gravity Center -crop 50x50+0+0",
      :large => "-gravity Center -crop 500x500+0+0",
    }
  }

end
