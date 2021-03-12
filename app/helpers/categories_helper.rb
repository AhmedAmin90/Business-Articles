module CategoriesHelper
    def archive_category_page(articles)
        
        list = '<div class= "row">'
        articles.each do |article|
            list += "<div class='col-3 p-0'> "
            list += '<div class="card bg-dark text-white border-0"> '
            list += "#{image_tag  article.image , height: '300px'}  "
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
        end
        list += '</div>'
        list.html_safe
    end

    def four_cards(categories)
        
        list = '<div class= "row">'
        categories.each do |category|
            list += '<div class="col-3 p-0 ">'
            list += '<div class="card bg-dark text-white border-0">'
            list += "#{image_tag  category.articles.last.image , class: "card-img feature-img"}  "
            list += '<div class="card-img-overlay card-article-content d-flex flex-column justify-content-between">'
            list += "<p class='card-text text-dark'> #{link_to category.name , category_path(category) , class: "card-article-category"} </p>"
            list += "<h5 class='card-title text-dark '> #{ link_to  category.articles.last.title , article_path(category.articles.last) , class: "card-article-title" }</h5>"
            list += '</div>'
            list += '</div>'
            list += '</div>'
        end
        list += '</div>'
        list.html_safe
    end
end

# def four_cards(articles)
#     list = '<div class= "row">'
#     articles.each do |article|
#         list += ' <div class="col-3 p-0 ">'
#         list += '<div class="card bg-dark text-white border-0">'
#         list += "#{image_tag  article.image , class: "card-img feature-img"}  "
#         list += '<div class="card-img-overlay card-article-content d-flex flex-column justify-content-between">'
#         list += "<p class='card-text text-dark'> #{link_to article.categories.first.name , category_path(article.categories.first.id) , class: "card-article-category"} </p>"
#         list += "<h5 class='card-title text-dark '> #{ link_to  article.title , article_path(article) , class: "card-article-title" }</h5>"
#         list += '</div>'
#         list += '</div>'
#         list += '</div>'
#     end
#     list += '</div>'
#     list.html_safe
# end