module ArticlesHelper
  def most_voted
    list = '<div class="card bg-dark text-white m-0 p-0 feature-article">'
    @articles = Article.includes(:votes)
    result = []
    @sorted_result = []
    if @articles.any?
      if Vote.all.empty?
        list += image_tag Article.last.image, class: 'div'.to_s
        list += '<div class="card-img-overlay feature-article-content d-flex flex-column justify-content-end">'
        list += "<h5 class='card-title text-dark '> #{link_to Article.last.title, article_path(Article.last), class: 'feature-article-title'} </h5> "
        list += "<p class='card-text text-dark'> #{link_to Article.last.categories.first.name, category_path(Article.last.categories.first.id), class: 'feature-article-category'} </p>  </div> </div>"

      else
        @articles.each do |article|
          result << {
            art_id: article.id,
            art_count: article.votes.count
          }
        end

        @sorted_result = result.max_by { |hash| hash[:art_count] }
        @article = Article.find_by_id(@sorted_result[:art_id])
        @article.title

        list += image_tag @article.image, class: 'div'.to_s
        list += '<div class="card-img-overlay feature-article-content d-flex flex-column justify-content-end">'
        list += " <h5 class='card-title text-dark '> #{link_to @article.title, article_path(@article), class: 'feature-article-title'} </h5> "
        list += " <p class='card-text text-dark'> #{link_to @article.categories.first.name, category_path(@article.categories.first.id), class: 'feature-article-category'} </p>  </div> </div>"

      end
    elsif user_signed_in?
      list = '<h1 class="text-center text-warning"> This is a new Busniness Articles Blog , No Articles here , please Write your first Article </h1>'
      list += '<div class="text-center m-4">'
      list += "<a class='m-2 p-2'> #{link_to 'Add Article', new_article_path, class: 'btn btn-light text-secondary'}</a>  </div> </div>"

    else
      list = '<h1 class="text-center text-warning p-4"> This is a new Busniness Articles Blog , No Articles here , please Sign in and Write your first Article </h1>'
      list += '<div class="text-center m-4">'
      list += "<a class='m-2 p-2'> #{link_to 'Sign In', new_user_session_path, class: 'btn btn-light text-secondary'}</a>"
      list += " <a class='m-2 p-2'> #{link_to 'Sign Up', new_user_registration_path, class: 'btn btn-light text-secondary'} </a>  </div> </div>"

    end

    list.html_safe
  end

  def edit_articles(article)
    list = if user_signed_in? && current_user.id == article.author_id
             "#{link_to 'Edit The Article', edit_article_path(@article), class: 'btn btn-secondary'}
            #{link_to 'Delete', article, method: :delete, data: { confirm: 'Are you sure?' }, class: 'btn bg-danger'} "
           else
             "#{link_to 'Back To Home page', root_path, class: 'btn btn-secondary'} "
           end

    list.html_safe
  end
end
