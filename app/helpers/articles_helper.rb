module ArticlesHelper
    def most_voted
        @articles = Article.includes(:votes)
        result = []
        @sorted_result = []
        @articles.each do |article|
            result <<  {
                art_id: article.id,
                art_count: article.votes.count 
            }
        end
        
        @sorted_result = result.sort_by {|hash| hash[:art_count]}.last
        @article = Article.find_by_id(@sorted_result[:art_id])
        @article.title

        list = "#{image_tag  @article.image , class: "card-img" , height: "500px"}"  
        list += '<div class="card-img-overlay feature-article-content d-flex flex-column justify-content-end">'
        list +=  " <h5 class='card-title text-dark '> #{link_to  @article.title , article_path(@article) , class: "feature-article-title"} </h5> "
        list += " <p class='card-text text-dark'> #{link_to @article.categories.first.name , category_path(@article.categories.first.id), class: "feature-article-category"} </p>"
        list += ' </div>'
        list.html_safe
    end

    def edit_articles(article)
        if user_signed_in? && current_user.id == article.author_id 
            list = "#{ link_to 'Edit The Article', edit_article_path(@article) , class: "btn btn-secondary"} "
             else
            list = "#{ link_to 'Back To Home page', root_path , class: "btn btn-secondary"} "
           end 
        list.html_safe
    end
end
