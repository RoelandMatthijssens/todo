json.array!(@rewards) do |reward|
  json.extract! reward, :id, :cost, :description
  json.url reward_url(reward, format: :json)
end
