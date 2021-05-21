class ItemController < ApplicationController
  def page
    @articles = Article.all
  end
end
