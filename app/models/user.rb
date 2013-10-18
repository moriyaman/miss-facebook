class User < ActiveRecord::Base
  include UserRank

  has_many :user_likes
  has_many :user_impressions
  
  has_one :user_score
  has_one :user_photo
  accepts_nested_attributes_for :user_photo
  
  attr_accessor :beyond_flg
  
  MAN = 1
  WOMAN = 2

  scope :uid_is, ->uid{where(uid: uid)}
  scope :has_photo, ->{joins(:user_photo).where('photo_file_name is not null')}
  scope :women, ->{where(gender_id: WOMAN)}

  def man?
    return self.gender_id == MAN ? true : false
  end
  
  def gender
    return self.gender_id == MAN ? 'MAN' : 'WOMAN'
  end 

  def to_beyond_user
    self.beyond_flg = true
  end 
 
  def beyond_user?
    return self.beyond_flg ? true : false
  end

  def to_change_gender_id(gender)
    self.gender_id = gender == "male" ? MAN : WOMAN
  end

  def score
    impression = UserImpression.user_id_is(self.id).size
    likes = UserLike.to_user_id_is(self.id).size
    return (likes == 0 || impression == 0) ? 0 : likes/impression
  end

  def friend_allow?
    return self.friend_allow_flg ? true : false
  end

  def statistics_by_age
    statistics = {}
    selected_user_id = self.man? ? self.user_likes.pluck('to_user_id').uniq : UserLike.to_user_id_is(self.id).pluck(:user_id).uniq 
  end
  
  def statistics_by_country
  
  end 
 
  def statistics_by_occupation
  
  end

  def photo
    return self.user_photo ? self.user_photo.photo.url(:large) : self.image_url
  end

  class << self
    def from_omniauth(auth)
      uid_is(auth.uid).first_or_initialize.tap do |user|
        user.uid = auth.uid
        user.access_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.mail = auth.info.email if auth.info.email
        user.image_url = auth.info.image.sub(/square/,"large")
        birthday = auth.extra.raw_info.birthday.split("/") unless auth.extra.raw_info.birthday.blank?
        user.birthday = Time.parse("#{birthday[1]}/#{birthday[0]}/#{birthday[2]}") unless auth.extra.raw_info.birthday.blank?
        user.to_change_gender_id(auth.extra.raw_info.gender) unless auth.extra.raw_info.gender.blank?
        return user.save ? user : nil
      end
    end
  end
end
