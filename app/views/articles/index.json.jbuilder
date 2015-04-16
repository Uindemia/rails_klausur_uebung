json.array!(@articles) do |article|
  json.extract! article, :id, :title, :teaser, :content, :publish_at, :publish_until, :author_id
  json.url article_url(article, format: :json)
end
