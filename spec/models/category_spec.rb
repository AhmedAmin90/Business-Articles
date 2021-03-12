require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Relations' do
    it { should have_many(:articles_categories) }
    it { should have_many(:articles) }
  end

  describe 'Name and Priority Presence ' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
  end
end