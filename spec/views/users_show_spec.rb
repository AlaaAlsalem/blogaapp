require 'rails_helper'

RSpec.feature 'Users Show', type: :feature do
  let(:first_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Aladdin\'s biography', post_counter: 3) }
  let!(:post1) do
    Post.create!(author: first_user, Title: 'Post #1', Text: 'some Text', ComentsCounter: 0, LikesCounter: 0)
  end
  let!(:post2) do
    Post.create!(author: first_user, Title: 'Post #2', Text: 'another post content', ComentsCounter: 0,
                 LikesCounter: 0)
  end
  let!(:post3) do
    Post.create!(author: first_user, Title: 'Post #3', Text: 'a new post with some interesting stuff',
                 ComentsCounter: 3, LikesCounter: 0)
  end
  let!(:post4) do
    Post.create!(author: first_user, Title: 'Post #4', Text: 'a post that should not be present on this page',
                 ComentsCounter: 0, LikesCounter: 0)
  end
  before do
    visit users_path(first_user)
  end
  it 'redirects to the post show page when you click on the button See all posts' do
    first('#btn-view-post').click
    expect(current_path).to eq(user_post_path(first_user))
  end
  it 'redirects to the index page of the posts on button click"' do
    click_link 'View more posts'
    expected_path = user_posts_path(first_user)
    actual_path = page.current_path
    expect(actual_path).to eq(expected_path)
  end
end

RSpec.feature 'Users Show', type: :feature do
  let(:first_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Aladdin\'s biography', post_counter: 3) }
  let!(:post1) do
    Post.create!(author: first_user, Title: 'Post #1', Text: 'some Text', ComentsCounter: 0, LikesCounter: 0)
  end
  let!(:post2) do
    Post.create!(author: first_user, Title: 'Post #2', Text: 'another post content', ComentsCounter: 0,
                 LikesCounter: 0)
  end
  let!(:post3) do
    Post.create!(author: first_user, Title: 'Post #3', Text: 'a new post with some interesting stuff',
                 ComentsCounter: 0, LikesCounter: 0)
  end
  let!(:post4) do
    Post.create!(author: first_user, Title: 'Post #4', Text: 'a post that should not be present on this page',
                 ComentsCounter: 0, LikesCounter: 0)
  end
  before do
    visit user_path(first_user)
  end
  it 'should be displayed on the users_show page' do
    expect(page).to have_content('Aladdin')
    expect(page).to have_content(first_user.post_counter)
    expect(page).to have_link('See all posts')
    expect(page).to have_content(first_user.bio)
    expect(page).to have_css('img[src="https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM"]')
  end
end

RSpec.feature 'Users Show', type: :feature do
  let(:first_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Aladdin\'s biography', post_counter: 3) }
  let!(:post1) do
    Post.create!(author: first_user, Title: 'Post #1', Text: 'some Text', ComentsCounter: 2, LikesCounter: 1)
  end
  let!(:post2) do
    Post.create!(author: first_user, Title: 'Post #2', Text: 'another post content', ComentsCounter: 2,
                 LikesCounter: 1)
  end
  let!(:post3) do
    Post.create!(author: first_user, Title: 'Post #3', Text: 'a new post with some interesting stuff',
                 ComentsCounter: 3, LikesCounter: 0)
  end
  let!(:post4) do
    Post.create!(author: first_user, Title: 'Post #4', Text: 'a post that should not be present on this page',
                 ComentsCounter: 5, LikesCounter: 10)
  end
  before do
    visit user_path(first_user)
  end
  it 'displays ownly the user\'s last three posts' do
    first_user.three_latest_posts.each do
      expect(page).to have_content(post4.Text)
      expect(page).to have_content(post3.Text)
      expect(page).to have_content(post2.Text)
      expect(page).to_not have_content(post1.Text)
    end
  end
end

RSpec.feature 'Users Show', type: :feature do
  let(:first_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/a-group-of-people-holding-a-teddy-bear-together-FAqkG14YOKM', bio: 'Aladdin\'s biography', post_counter: 3) }
  let!(:post1) do
    Post.create!(author: first_user, Title: 'Post #1', Text: 'some Text', ComentsCounter: 2, LikesCounter: 1)
  end
  let!(:post2) do
    Post.create!(author: first_user, Title: 'Post #2', Text: 'another post content', ComentsCounter: 2,
                 LikesCounter: 1)
  end
  let!(:post3) do
    Post.create!(author: first_user, Title: 'Post #3', Text: 'a new post with some interesting stuff',
                 ComentsCounter: 3, LikesCounter: 0)
  end
  let!(:post4) do
    Post.create!(author: first_user, Title: 'Post #4', Text: 'a post that should not be present on this page',
                 ComentsCounter: 5, LikesCounter: 10)
  end
  before do
    visit user_path(first_user)
  end
  it 'checks if the button to see all the posts exists on the page' do
    expect(page).to have_selector(:link_or_button, 'See all posts')
  end
end
