require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Relations' do
    it { should belong_to(:author) }
    it { should have_many(:votes) }
    it { should have_many(:articles_categories) }
    it { should have_one_attached(:image) }
  end
  describe 'Title Presence' do
    it { should validate_presence_of(:title) }
  end

  describe 'Text Presence' do
    it { should validate_presence_of(:text) }
  end

  describe 'Text length' do
    it { should validate_length_of(:text) }
  end
end
