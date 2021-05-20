class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :price
      t.string :publication_date
      t.string :date
      t.string :category
      t.integer :article_rating

      t.timestamps
    end
  end
end
