class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        @articles = Article.includes(:categories)
        @four_articles =  @articles.joins(:categories).merge(Category.order(priority: :asc)).limit(4)
        @feature_article = @articles.joins(:votes).merge(Vote.order(article_id: :desc)).first

    end

    def show 
      @category = Category.find(params[:id])
      @articles = Article.includes(:categories).where(categories: { name: @category.name })
    end

end
