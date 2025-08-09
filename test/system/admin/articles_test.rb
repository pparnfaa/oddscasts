require "application_system_test_case"

class Admin::ArticlesTest < ApplicationSystemTestCase
  setup do
    @admin_article = admin_articles(:one)
  end

  test "visiting the index" do
    visit admin_articles_url
    assert_selector "h1", text: "Articles"
  end

  test "should create article" do
    visit admin_articles_url
    click_on "New article"

    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "should update Article" do
    visit admin_article_url(@admin_article)
    click_on "Edit this article", match: :first

    click_on "Update Article"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "should destroy Article" do
    visit admin_article_url(@admin_article)
    click_on "Destroy this article", match: :first

    assert_text "Article was successfully destroyed"
  end
end
