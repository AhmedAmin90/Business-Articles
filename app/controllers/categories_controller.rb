class CategoriesController < ApplicationController
    def index
        @cateogries = Category.includes(:name , :priority)
        @articles = Article.all
        @feature_article = Article.joins(:votes).merge(Vote.order(article_id: :desc))
    end

    def new
        @Category = Category.new
    end

    def create
      @category = Category.new(category_params)
  
        if @Category.save
         redirect_to categories_path, notice: "Category was successfully created." 
        else
          render :new
        end
    end

      private
    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:cateogry).permit(:name, :priority)
    end

end
