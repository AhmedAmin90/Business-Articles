module VotesHelper
  def vote_or_unvote_btn(article)
    if user_signed_in?
      vote = Vote.find_by(article_id: article.id, user_id: current_user.id)
      if vote
        link_to('Unvote!', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
      else
        link_to('Vote!', article_votes_path(article_id: article.id), method: :post)
      end
    else
      link_to('Sign in to Vote', new_user_session_path, class: 'btn btn-warning m-1')
    end
  end
end
