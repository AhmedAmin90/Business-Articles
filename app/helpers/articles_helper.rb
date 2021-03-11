module ArticlesHelper
    def edit_articles(article)
        if user_signed_in? && current_user.id == article.author_id 
            list = "#{ link_to 'Edit The Article', edit_article_path(@article) , class: "btn btn-secondary"} "
             else
            list = "#{ link_to 'Back To Home page', root_path , class: "btn btn-secondary"} "
           end 
        list.html_safe
    end
end
