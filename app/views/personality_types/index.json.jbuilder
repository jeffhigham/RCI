json.array!(@categories) do |personality_type|
  json.extract! personality_type, :name, :title, :message
  json.url personality_type_url(personality_type, format: :json)
end
