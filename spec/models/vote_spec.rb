require 'rails_helper'
RSpec.describe Vote, type: :model do
  describe 'Relations' do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end
  describe 'Article and User ids Presence' do
    it { should validate_presence_of(:article_id) }
    it { should validate_presence_of(:user_id) }
  end
end
