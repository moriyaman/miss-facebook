class User < ActiveRecord::Base

  has_many :user_photos
  has_many :user_likes
  accepts_nested_attributes_for :user_photos
  
  MAN = 1
  WOMAN = 2

  scope :uid_is, ->uid{where(uid: uid)}

  
  def gender
    return self.gender_id == MAN ? 'MAN' : 'WOMAN'
  end 

  def to_change_gender_id(gender)
    self.gender_id = gender == "male" ? MAN : WOMAN
  end

  class << self
    def from_omniauth(auth)
      uid_is(auth.uid).first_or_initialize.tap do |user|
        user.uid = auth.uid
        user.access_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.mail = auth.info.email if auth.info.email
        birthday = auth.extra.raw_info.birthday.split("/") unless auth.extra.raw_info.birthday.blank?
        user.birthday = Time.parse("#{birthday[1]}/#{birthday[0]}/#{birthday[2]}") unless auth.extra.raw_info.birthday.blank?
        user.to_change_gender_id(auth.extra.raw_info.gender) unless auth.extra.raw_info.gender.blank?
        return user.save ? user : nil
      end
    end
  end
end
