require 'rails_helper'

describe "user deletes article" do
  describe "user visits article's show page" do
    describe "user clicks on delete button" do
      it "sees index page and does not see deleted article" do
        article_1 = Article.create!(title: "Title_1", body: "Body_1")
        article_2 = Article.create!(title: "Title_2", body: "Body_2")

        visit article_path(article_1)
        click_link "Delete"

        expect(current_path).to eq(articles_path)
        expect(page).to_not have_content(article_1.body)
        expect(page).to have_content(article_2.title)
        expect(page).to have_content(article_2.body)
        expect(page).to have_content("Article Title_1 was deleted.")
      end
    end
  end
end
