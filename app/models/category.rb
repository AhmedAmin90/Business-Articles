class Category < ApplicationRecord
    has_many :articles_categories
    has_many :articles , through: :articles_categories

    scope :entrepreneurship, -> { where(:name => "entrepreneurship")}
    scope :economy, -> { where(:name => "Economy")}
    scope :technology, -> { where(:name => "Technology")}
    scope :marketing, -> { where(:name => "marketing")}
    # Ex:- scope :active, -> {where(:active => true)}
end
