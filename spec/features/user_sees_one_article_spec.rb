require 'rails_helper'

describe "user sees one article" do
  describe "user links from the articles index" do
    it "sees information for one artcle" do
      article = Article.create!(title: "Title 1", body: "Body 1")

      visit '/articles'
      clink_link "#{article.title}"

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.description)
      expect(page).to have_path("/articles/#{article.id}")
    end
  end
end
