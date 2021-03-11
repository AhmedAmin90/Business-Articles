module CategoriesHelper
    def show_category_page(articles)
        
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
            list += "<p class='btn bg-orange m-1'>  #{article.votes.count} </p>"
            list += '</div>'
            list += '</div>'
            list += '</div>'
        end
        list += '</div>'
        list.html_safe
    end
end