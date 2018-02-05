require 'rails_helper'

describe "user sees one article" do
  describe "user links from the articles index" do
    it "sees information for one artcle" do
      article = Article.create!(title: "Title 1", body: "Body 1")
      comment_1 = article.comments.create(author_name: "Me", body: "Comment comments")
      comment_2 = article.comments.create(author_name: "You", body: "So much to say")


      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(current_path).to eq("/articles/#{article.id}")
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
