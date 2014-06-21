json.array!(@things) do |thing|
  json.extract! thing, :id, :name, :description, :lat, :lng, :image
  json.url thing_url(thing, format: :json)
end
