json.extract! article, :id, :title, :author, :description, :price, :publication_date, :category, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
