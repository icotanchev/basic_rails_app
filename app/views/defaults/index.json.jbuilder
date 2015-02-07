json.array!(@defaults) do |default|
  json.extract! default, :id, :name
  json.url default_url(default, format: :json)
end
