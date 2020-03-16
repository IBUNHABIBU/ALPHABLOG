require 'rails_helper'
RSpec.feature "Deleting an article" do 
  before do 
    @article = Article.create(title:"first article",body:"content for the first article")
  end
  scenario "A user deleting an article" do 
    visit '/'
    click_link @article.title 
    click_link "Delete Article"
    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end