require 'rails_helper'

describe "user edits article" do
  describe "user links from article's show page" do
    describe "user fills in form and clicks submit" do
      it "user sees updated article info on show page" do
        article = Article.create!(title: "Teach Your Bird to Dance", body: "Take Bird in hands and do the tango")
        new_body = "Take Bird in hands and do the samba"

        visit article_path(article)
        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article))

        fill_in("article[body]", with: new_body)
        click_on "Edit Article"

        expect(current_path).to eq(article_path(article))
        expect(page).to have_content(new_body)
      end
    end
  end
end
