class HomeController < ApplicationController
  def page
    @featured_article = Article.all.sample
  end
end
