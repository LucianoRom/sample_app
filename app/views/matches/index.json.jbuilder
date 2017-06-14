json.array!(@matches) do |match|
  json.extract! match, :id, :date, :salle, :ville, :orga
  json.url match_url(match, format: :json)
end
