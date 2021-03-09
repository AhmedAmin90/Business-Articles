class Category < ApplicationRecord
    has_many :articles , through: :articles_categories
end
