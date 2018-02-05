require 'rails_helper'

describe "user creates new article" do
  describe "user links from article index" do
    describe "user fills in form and clicks submit" do
      it "sees new article info" do
        title = "Teach Your Cat to Dance"
        description = "Look them in the eyes and say DANCE MONKEY"

        visit articles_path
        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in("article[title]", with: title)
        fill_in("article[body]", with: description)
        click_on "Create Article"
        
        expect(page).to have_content(title)
        expect(page).to have_content(description)
        expect(page).to have_content("Article Teach Your Cat to Dance was created.")
        # expect(current_path).to eq('/articles/1')
      end
    end
  end
end
