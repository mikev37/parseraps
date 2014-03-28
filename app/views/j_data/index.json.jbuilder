json.array!(@j_data) do |j_datum|
  json.extract! j_datum, :id, :jInput, :jOutput
  json.url j_datum_url(j_datum, format: :json)
end
