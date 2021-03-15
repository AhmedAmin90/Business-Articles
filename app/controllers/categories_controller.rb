class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:articles).order(priority: :asc)
    @articles = Article.includes(:categories, :votes)
  end

  def show
    @category = Category.find(params[:id])
    @articles = Article.includes(:categories, :author, :votes).where(categories: { name: @category.name })
  end
end
