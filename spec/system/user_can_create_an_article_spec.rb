require 'rails_helper'
describe 'User can see article' do
  context 'an article exists' do
    before do
      create(:article)
    end
    it "display article on page" do
      visit root_path
      expect(page).to have_selector("[data-testid='article-title']", text: 'Sprint on Rails')
      save_and_open_page
    end
  end
end
