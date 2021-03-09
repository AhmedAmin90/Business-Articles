class VotesController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @vote = Vote.create(user_id: current_user.id ,article_id: @article.id)

        if @vote.save
            redirect_to article_path(@article) , notice: 'You voted the article.'
        else
            redirect_to article_path(@article), alert: 'You cannot vote this article.'
        end
    end
    
    def destroy
        @article = Article.find(params[:article_id])
        vote = Vote.find_by(id: params[:id], user_id: current_user.id, article_id: @article.id)
        if vote
            vote.destroy
            redirect_to article_path(@article), notice: 'You unvoted the article.'
          else
            redirect_to article_path(@article), alert: 'You cannot invoted an article that you did not vote before.'
        end
    end
end
