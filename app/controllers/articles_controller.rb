class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  
# Shows all articles in database, allowing user to edit, show and destroy
  def index
    @articles = Article.all.order(:created_at).reverse_order
  end

# Shows article with price and checkout button
  def show
  end

# Below two methods create a new article. All fields must be filled in to be able to submit.
  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
  
    respond_to do |format|
      
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end



# Method for search bar function in nav bar
  def search
    if params[:query].blank?
      @listings = nil
    else
        # Do a search based on "LIKE" parameters
        @parameter = params[:query].downcase
        @listings = Article.all.where("lower(title) LIKE :search OR lower(description) like :search OR lower(author) LIKE :search", search: "%#{@parameter}%")
    end
  end

# Method for category search filter on home page
  def category
    if params[:id].blank?
      @listings = nil
    else
        # Do a search based on "LIKE" parameters
        @listings = Article.all.where(category_id: params[:id])
    end
  end

# Method for allowing only user to see the index display of articles
  def portfolio
    if user_signed_in?
    @portfolio = Article.where(user_id: current_user.id)
    else
    end
  end

# Below two methods allow owner of the listing is able to edit/update their article
  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

# Allows owner of listing to delete their article
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

# Requires users to log in when creating new article
  private
    def set_article
      @article = Article.find(params[:id])
    end

# Determines what is required when entering a new article
    def article_params
      params.require(:article).permit(:title, :author, :description, :price, :publication_date, :category_id, :user_id, :thumbnail, :image)
    end

end
