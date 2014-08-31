json.array!(@items) do |item|
  json.extract! item, :id, :title, :url, :author_id, :content, :summary, :image, :published, :updated, :entry_id
  json.url item_url(item, format: :json)
end
