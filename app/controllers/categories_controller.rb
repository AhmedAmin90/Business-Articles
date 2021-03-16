class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:articles).order(priority: :asc)
    @articles = Article.includes(:categories, :votes).all
  end

  def show
    @category = Category.find(params[:id])
    @articles = Article.includes(:categories, :author,
                                 :votes).where(categories: { name: @category.name }).order(created_at: :desc)
  end
end
