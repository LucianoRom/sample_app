json.array!(@updates) do |update|
  json.extract! update, :id, :detail, :status
  json.url update_url(update, format: :json)
end
