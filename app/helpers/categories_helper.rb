# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
module CategoriesHelper
  def archive_category(articles)
    group_one = []
    group_two = []
    articles_one = []
    articles_two = []
    articles.each_with_index do |article, i|
      group_one << article if i.even?
      group_two << article if i.odd?
    end
    group_one.each_with_index do |article, i|
      articles_one << article if i.even?
      articles_two << article if i.odd?
    end
    group_two.each_with_index do |num, i|
      articles_one << num if i.even?
      articles_two << num if i.odd?
    end

    list = '<div class= "row">'

    articles.each do |article|
      if articles_one.include?(article)
        list += "<div class='col-3 p-0'> "
        list += '<div class="card bg-dark text-white border-0"> '
        list += "#{image_tag article.image, height: '300px'}  "
        list += '</div>'
        list += '</div>'
        list += '<div class="col-3 p-0">'
        list += '<div class="card details-card border-0 rounded-0">'
        list += '<div class="card-body ">'
        list += " <h5 class='card-title text-yellow'> #{article.categories.first.name}</h5>"
        list += " <h6 class='card-subtitle mb-2  text-gray fw-bold'> #{article.title} </h6>"
        list += " <p class='card-subtitle text-warning fw-bold'> Author: #{article.author.name} </p>"
        list += " <p class='card-text'> #{article.text.slice(0..150)}... </p>"
        list += "<p class='btn btn-warning mx-1 mt-2'>  #{vote_or_unvote_btn(article)} </p> <p class='btn bg-orange mx-1 mt-2'> Votes: #{article.votes.count} </p> </div> </div> </div>"
        
      else
        list += '<div class="col-3 p-0">'
        list += '<div class="card details-card border-0 rounded-0">'
        list += '<div class="card-body">'
        list += " <h5 class='card-title'> #{article.categories.first.name}</h5>"
        list += " <h6 class='card-subtitle mb-2 text-muted'> #{article.title} </h6>"
        list += " <p class='card-subtitle   text-warning fw-bold'> Author: #{article.author.name} </p>"
        list += " <p class='card-text'> #{article.text.slice(0..200)}... </p>"
        list += "<p class='btn btn-warning m-1'>  #{vote_or_unvote_btn(article)} </p> <p class='btn bg-orange m-1'> Votes: #{article.votes.count} </p>"
        list += '</div>'
        list += '</div>'
        list += '</div>'
        list += "<div class='col-3 p-0'> "
        list += '<div class="card bg-dark text-white border-0"> '
        list += "#{image_tag article.image, height: '300px'}  </div> </div>"
      end
    end
    list += '</div>'
    list.html_safe
  end

  def four_cards(categories)
    list = '<div class="row">'

    if categories.all.any? && Article.all.any?
      categories.each do |category|
        next unless category.articles.any?

        list += '<div class="col-3 p-0 ">'
        list += '<div class="card  border-0">'
        list += '<div class="card bg-dark text-white border-0">'
        list += "#{image_tag category.articles.last.image, height: '300px'}  "
        list += '<div class="card-img-overlay rounded-0  card-article-content d-flex flex-column justify-content-between">'
        list += "<p class='card-text text-dark'> #{link_to category.name, category_path(category), class: 'card-article-category'} </p>"
        list += "<h5 class='card-title text-dark '> #{link_to category.articles.last.title, article_path(category.articles.last), class: 'card-article-title'}</h5>"
        list += '</div>'
        list += '</div>'
        list += '</div>'
        list += '</div>'
      end

    else
      list += '<div class= "text-center m-5 bg-gray ">'
      list += '<h1 class="text-center text-warning"> No Articles Yet </h1>'
      list += '</div> </div>'
    end
    list += '</div>'
    list.html_safe
  end
end
# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
