json.array!(@tests) do |test|
  json.extract! test, :id, :num
  json.url test_url(test, format: :json)
end
