class Article < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :articles_categories
    has_many :categories , through: :articles_categories
    has_many :votes
end
