json.array!(@very_buildings) do |very_building|
  json.extract! very_building, :id, :user_id, :such_type, :position, :hp
  json.url very_building_url(very_building, format: :json)
end
