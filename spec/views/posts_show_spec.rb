require 'rails_helper'
RSpec.describe 'posts#show', type: :feature do
  let(:first_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Aladdin\'s biography', post_counter: 3) }
  let(:second_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Aladdin\'s biography', post_counter: 3) }
  let!(:post1) do
    Post.create!(author: second_user, Title: 'Post #1', Text: 'some Text', ComentsCounter: 0, LikesCounter: 0)
  end
  let!(:comment) { Comment.create!(author: second_user, post: post1, Text: 'This is a comment on the post1') }
  let!(:like) { Like.create!(author: second_user, post: post1) }
  before do
    visit user_post_path(first_user, post1)
  end
  it 'displays the title of the post on the page' do
    expect(page).to have_content(post1.Title)
  end
  it 'displays the author\'s name' do
    expect(page).to have_content(post1.author.name)
  end
  it 'displays the the Text of the post' do
    expect(page).to have_content(post1.Text)
  end
  it 'displays the the Text of the post' do
    expect(page).to have_content('some Text')
  end
  it 'displays the number of comments on the post' do
    expect(page).to have_content("Comments: #{post1.ComentsCounter}")
  end
  it 'displays the username of each person the comments belong to' do
    expect(page).to have_content(post1.comments.first.author.name)
  end
  it 'displays the number of likes of the post' do
    expect(page).to have_content("Likes: #{post1.LikesCounter}")
  end
  it 'displays all the comments' do
    expect(page).to have_content(post1.comments.first.Text)
  end
  it 'displays a button for adding a new comment' do
    expect(page).to have_content('Comments')
  end
  it 'displays a button to Like the post' do
    expect(page).to have_selector(:link_or_button, 'Like')
  end
end
