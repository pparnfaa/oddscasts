require 'rails_helper'

RSpec.describe 'User can see article', type: :system do
  let!(:admin) { User.create(email_address: "admin@example.com", password: "password", admin: true) }

  before do
    driven_by(:rack_test)

    # Login as admin
    visit '/session/new'
    fill_in "Enter your email address", with: "admin@example.com"
    fill_in "Enter your password", with: "password"
    click_button "Sign in"
  end

  context 'an article exists' do
    let!(:article) { Article.create(title: "Sprint on Rails", description: "Some description text", status: "draft") }

    it "displays article on page" do
      visit admin_articles_path
      expect(page).to have_selector("[data-testid='article-title']", text: article.title)
    end
  end
end
