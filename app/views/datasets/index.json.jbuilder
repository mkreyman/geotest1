json.array!(@datasets) do |dataset|
  json.extract! dataset, :id, :name, :description, :user_id
  json.url dataset_url(dataset, format: :json)
end
