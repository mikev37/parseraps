json.array!(@write_ins) do |write_in|
  json.extract! write_in, :id, :address, :input
  json.url write_in_url(write_in, format: :json)
end
