json.array!(@users) do |user|
  json.extract! user, :id, :nickname, :mail, :device, :password
  json.url user_url(user, format: :json)
end
