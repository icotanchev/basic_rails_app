json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :job_title, :role
  json.url user_url(user, format: :json)
end
