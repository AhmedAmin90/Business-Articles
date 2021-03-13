require 'rails_helper'

RSpec.feature 'Error if some fields in article not present', type: :feature do
  before :each do
    @user = User.create(name: 'test', email: 'test@mail.com', password: '123456')
    Category.create(id: 1, name: 'one', priority: 1)
  end

  describe 'User Sign' do
    let :login do
      visit user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end

    context 'Create New Article without image or other required field' do
      it 'Sign and visit new article path' do
        login
        visit new_article_path

        fill_in 'Title', with: 'Title test'
        fill_in 'Text', with: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
        select 'one', from: 'selected_id'
        click_on 'Create Article'
        expect(page).to have_content('Please review the problems below')
      end
    end
  end
end
