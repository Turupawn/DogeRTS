json.array!(@very_loots) do |very_loot|
  json.extract! very_loot, :id, :user_id, :amount, :such_date
  json.url very_loot_url(very_loot, format: :json)
end
