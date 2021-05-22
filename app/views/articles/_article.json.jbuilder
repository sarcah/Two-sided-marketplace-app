json.extract! article, :id, :title, :author, :description, :price, :publication_date, :category, :image, :thumbnail, :created_at, :updated_at
json.url article_url(article, format: :json)
