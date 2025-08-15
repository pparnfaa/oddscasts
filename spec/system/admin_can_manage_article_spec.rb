require 'rails_helper'

RSpec.describe "Admin manages articles", type: :system do
  let!(:admin) { User.create(email_address: "admin@example.com", password: "password", admin: true) }

  before do
    driven_by(:rack_test)

    # Login
    visit '/session/new'
    fill_in "Enter your email address", with: "admin@example.com"
    fill_in "Enter your password", with: "password"
    click_button "Sign in"
  end

  context "when creating an article" do
    it "can create an article and save as draft" do
      visit admin_articles_path
      expect(page).to have_selector("[data-testid='new-article']")

      find("[data-testid='new-article']").click
      fill_in "Title", with: "New Sprint Article"
      fill_in "Description", with: "Content of article"
      click_button "Save as Draft"

      expect(page).to have_content("Article was successfully created.")
      expect(page).to have_content("New Sprint Article")
    end
  end

  context "when editing an article" do
    let!(:article) { Article.create(title: "Old Title", description: "Old content", status: "draft") }

    it "can update an article and submit for review" do
      visit edit_admin_article_path(article)

      fill_in "Title", with: "Updated Sprint Article"
      click_button "Submit for Review"

      expect(page).to have_content("Article was successfully updated.")
      expect(page).to have_content("Updated Sprint Article")
    end
  end

  context "when approving an article" do
    let!(:article) { Article.create(title: "For Approval", description: "Content", status: "waiting_for_review") }

    it "can approve an article" do
      visit admin_article_path(article)
      click_button "Approve"
      expect(page).to have_content("Article approved")
    end
  end

  context "when rejecting an article" do
    let!(:article) { Article.create(title: "For Rejection", description: "Content", status: "waiting_for_review") }

    it "can reject an article" do
      visit admin_article_path(article)
      click_button "Reject"
      expect(page).to have_content("Article rejected")
    end
  end
end
