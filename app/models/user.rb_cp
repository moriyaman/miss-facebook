class User < ActiveRecord::Base

  scope: uid_is, ->uid{where(uid: uid)}

  class << self
    def self.from_omniauth(auth)
      p auth
      uid_is(auth.slice(:uid)).first_or_initialize.tap do |user|
        user.uid = auth.uid
        user.access_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.mail = auth['info']['email'] if auth['info']['email']
        user.birthday = auth['info']['birthday']
        user.save!
      end
    end

end
