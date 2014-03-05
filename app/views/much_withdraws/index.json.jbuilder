json.array!(@much_withdraws) do |much_withdraw|
  json.extract! much_withdraw, :id, :building_id, :such_date, :amount
  json.url much_withdraw_url(much_withdraw, format: :json)
end
