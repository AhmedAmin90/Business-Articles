class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        @articles = Article.joins(:categories).merge(Category.order(priority: :asc)).limit(4)
        @feature_article = Article.joins(:votes).merge(Vote.order(article_id: :desc)).first

    end

    def show 
      @category = Category.find(params[:id])
      @articles = Article.includes(:categories).where(categories: { name: @category.name })
    end

    def new
        @category = Category.new
    end

    def create
      @category = Category.new(category_params)
  
        if @category.save
         redirect_to categories_path, notice: "Category was successfully created." 
        else
          render :new
        end
    end

      private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :priority)
    end

end
