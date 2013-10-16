json.array!(@users) do |user|
  json.extract! user, :nick_name, :country_id, :address, :birthday, :gender, :occupation_id, :mail, :uid
  json.url user_url(user, format: :json)
end
