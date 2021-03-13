module CategoriesHelper

    def archive_category_page(articles)
        group_one = []
        group_two = []
        articles_one = []
        articles_two = []
        articles.each_with_index do |article , i|
            group_one <<  article if i % 2 == 0 
            group_two << article if i % 2 != 0
        end
        group_one.each_with_index do |article , i|
            articles_one << article if i % 2 == 0
            articles_two << article if i % 2 != 0 
        end
        group_two.each_with_index do |num , i|
            articles_one << num if i % 2 == 0
            articles_two << num if i % 2 != 0 
        end
        
        list = '<div class= "row">'
        
        articles.each do |article|
          if articles_one.include?(article)
            list += "<div class='col-3 p-0'> "
            list += '<div class="card bg-dark text-white border-0"> '
            list += "#{ image_tag article.image }  " 
            list += '</div>'
            list += '</div>'
            list += '<div class="col-3 p-0">'
            list += '<div class="card details-card border-0">'
            list += '<div class="card-body">'
            list += " <h5 class='card-title'> #{article.categories.first.name}</h5>"
            list += " <h6 class='card-subtitle mb-2 text-muted'> #{article.title} </h6>"
            list += " <p class='card-text'> #{article.text.slice(0..200)}... </p>"
            list += "<p class='btn btn-warning m-1'>  #{vote_or_unvote_btn(article)} </p>"
            list += "<p class='btn bg-orange m-1'> Votes: #{article.votes.count} </p>"
            list += '</div>'
            list += '</div>'
            list += '</div>'
          else
            list += '<div class="col-3 p-0">'
            list += '<div class="card details-card border-0">'
            list += '<div class="card-body">'
            list += " <h5 class='card-title'> #{article.categories.first.name}</h5>"
            list += " <h6 class='card-subtitle mb-2 text-muted'> #{article.title} </h6>"
            list += " <p class='card-text'> #{article.text.slice(0..200)}... </p>"
            list += "<p class='btn btn-warning m-1'>  #{vote_or_unvote_btn(article)} </p>"
            list += "<p class='btn bg-orange m-1'> Votes: #{article.votes.count} </p>"
            list += '</div>'
            list += '</div>'
            list += '</div>'
            list += "<div class='col-3 p-0'> "
            list += '<div class="card bg-dark text-white border-0"> '
            list += "#{ image_tag article.image }  "
            list += '</div>'
            list += '</div>'
          end 
        end
        list += '</div>'
        list.html_safe
    end

    def four_cards(categories)
      list = '<div class= "row">'
      if  categories.all.any? && Article.all.any?
        categories.each do |category|
          if category.articles.any?
           
            list += '<div class="col-3 p-0 ">'
            list += '<div class="card bg-dark text-white border-0">'
            list += "#{ image_tag category.articles.last.image , class: "card-img feature-img" }  "
            list += '<div class="card-img-overlay card-article-content d-flex flex-column justify-content-between">'
            list += "<p class='card-text text-dark'> #{link_to category.name , category_path(category) , class: "card-article-category"} </p>"
            list += "<h5 class='card-title text-dark '> #{ link_to  category.articles.last.title , article_path(category.articles.last) , class: "card-article-title" }</h5>"
            list += '</div>'
            list += '</div>'
            list += '</div>'
            list += '</div>'
            
            end
          end
          list.html_safe
       else 
            list = '<div class= "text-center m-5 bg-gray ">'
            list += '<h1 class="text-center text-warning"> No Articles Yet </h1>'
            list += '</div>'
         
       end
       list.html_safe
    end
       
end
