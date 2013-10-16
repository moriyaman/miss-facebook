Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, :scope =>'email,user_photos,user_relationships,user_birthday,read_friendlists,user_location,user_work_history'
 end 
