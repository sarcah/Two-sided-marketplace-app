class Article < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_one_attached :thumbnail 
    validates :image, presence: { message: " - Every article needs to have a image for purchase" }
end
