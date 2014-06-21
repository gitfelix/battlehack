json.array!(@bounties) do |bounty|
  json.extract! bounty, :id, :name, :email
  json.url bounty_url(bounty, format: :json)
end
