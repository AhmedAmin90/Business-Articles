class Category < ApplicationRecord
    has_many :articles_categories
    has_many :articles , through: :articles_categories

   

    scope :entrepreneurship, -> { find_by_name("entrepreneurship")}
    scope :economy, -> { find_by_name("Economy")}
    scope :technology, -> { find_by_name("Technology")}
    scope :marketing, -> { find_by_name("marketing")}

    
    validates :name , presence: true
    validates :priority , presence: true
   
end
