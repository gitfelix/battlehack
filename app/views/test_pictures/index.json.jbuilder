json.array!(@test_pictures) do |test_picture|
  json.extract! test_picture, :id
  json.url test_picture_url(test_picture, format: :json)
end
