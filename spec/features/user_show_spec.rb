require 'spec_helper'

RSpec.describe 'User integrations', type: :feature do
  it 'displays user profile in show page' do
    user = create(:user)
    visit user_path(user)
    expect(page).to have_content('Andrew Carnegie')
  end

  it 'displays user username in show page' do
    user = create(:user, username: 'acarnegie')
    visit user_path(user)
    expect(page).to have_content(user.username)
  end
  it 'displays total number of posts' do
    user = create(:user)
    create_list(:post, 3, user:)
    visit user_path(user)
    expect(page).to have_content("Posts Number: #{user.posts.count}")
  end
  it 'displays user bio' do
    user = create(:user, bio: 'Lorem ipsum dolor sit amet')
    visit user_path(user)
    expect(page).to have_content(user.bio)
  end

  it 'displays the three most recent posts written by the user' do
    user = create(:user)
    create(:post, user:, title: 'First Post', created_at: 3.days.ago)
    create(:post, user:, title: 'Second Post', created_at: 2.days.ago)
    create(:post, user:, title: 'Third Post', created_at: 1.day.ago)
    visit user_path(user)
    expect(page).to have_content('Third Post')
    expect(page).to have_content('Second Post')
    expect(page).to have_content('First Post', count: 1)
  end
  it 'redirects to all user posts ' do
    user = create(:user)
    visit user_path(user)
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
  it 'redirects to  user show page of the user ' do
    user = create(:user)
    create(:post, user:)
    visit users_path(user)
    click_link 'More details'
    expect(current_path).to eq(user_path(user))
  end

  it 'redirects to create new post page when user clicks on "New Post" link' do
    user = create(:user)
    create(:post, user:)
    visit user_posts_path(user)
    click_link 'New post'
    expect(current_path).to eq(new_user_post_path(user))
  end
  it 'redirects to add new comment page when user clicks on "New comments:" link' do
    user = create(:user)
    post = create(:post, user:)
    visit user_post_path(user, post)
    click_link 'Add comment'
    expect(current_path).to eq(new_user_post_comment_path(user, post))
  end
  it 'redirects to add new like page when user clicks on "Likes:" ' do
    user = create(:user)
    post = create(:post, user:)
    visit user_post_path(user, post)
    click_link 'Add Like'
    expect(current_path).to eq(new_user_post_like_path(user, post))
  end
  it 'shows photo' do
    image = page.all('img')
    expect(image.size).to eql(1)
  end
end
