module ArticlesHelper
    def select_category(article)
       selected_category = Category.find()
       ArticlesCategory.create(article_id: article.id , category_id: selected_category.id)
    end
end
