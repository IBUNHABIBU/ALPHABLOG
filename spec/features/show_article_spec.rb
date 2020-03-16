require 'rails_helper'
RSpec.feature "Listing Articles" do 
 before do 
   john = User.create(email:"john@gmail.com",password:"123456")
   login_as(john)
  @article = Article.create(title:"Article heading 1",body:"Body of first article", user: john)
 end
 scenario "A user show an article" do 
  visit '/'
  click_link @article.title
  expect(page).to have_content(@article.title)
  expect(page).to have_content(@article.body)
  expect(current_path).to eq(article_path(@article))
 end
 end