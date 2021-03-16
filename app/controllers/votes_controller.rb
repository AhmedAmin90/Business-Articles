class VotesController < ApplicationController
  before_action :before_destory, only: %i[destroy]

  def create
    @article = Article.find(params[:article_id])
    @vote = Vote.create(user_id: current_user.id, article_id: @article.id)

    if @vote.save
      redirect_to category_path(@article.categories.first.id), notice: 'You voted the article.'
    else
      redirect_to category_path(@article.categories.first.id), alert: 'You cannot vote this article.'
    end
  end

  def destroy
    if @vote
      @vote.destroy
      redirect_to category_path(@article.categories.first.id), notice: 'You unvoted the article.'
    else
      redirect_to category_path(@article.categories.first.id),
                  alert: 'You cannot invoted an article that you did not vote before.'
    end
  end

  private

  def before_destory
    @article = Article.find(params[:article_id])
    @vote = Vote.find_by(id: params[:id], user_id: current_user.id, article_id: @article.id)
  end
end
