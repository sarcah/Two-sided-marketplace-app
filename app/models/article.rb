class Article < ApplicationRecord
    belongs_to :user
    has_one :category
    has_one_attached :image
    has_one_attached :thumbnail 
    validates :image, :title, :author, :price, :description, presence: true
end
