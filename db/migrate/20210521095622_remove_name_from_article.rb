class RemoveNameFromArticle < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :article_rating, :integer
  end
end
