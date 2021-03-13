class Article < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :articles_categories
    has_many :categories , through: :articles_categories
    has_many :votes

    # for images
    has_one_attached :image

    # validations:
    validates :title, presence: true
    validates :image, presence: true
    validates :text, presence: true, length: { minimum: 20 }
   
end
