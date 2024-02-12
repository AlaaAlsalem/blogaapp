require 'rails_helper'

describe 'User Index Page Features', type: :feature, js: true do
  let(:new_user) { User.create!(name: 'Aladdin', photo: 'https://unsplash.com/photos/woman-wearing-black-camisole-top-walking-on-grass-field-during-sunrise-2FrX56QL7P8', bio: 'Description of the first user\'s biography.', post_counter: 0) }
  let!(:post1) do
    Post.create!(author: new_user, Title: 'Post #1', Text: 'some text', ComentsCounter: 2, LikesCounter: 1)
  end
  let!(:post2) do
    Post.create!(author: new_user, Title: 'Post #2', Text: 'another post content', ComentsCounter: 2,
                 LikesCounter: 1)
  end
  before :each do
    visit user_path
  end

  it 'displays a button to add a new post on behalf of the first user' do
    expect(page).to have_selector(:link_or_button, 'Post')
  end

  it 'lists the username of all other users' do
    expect(page).to have_content(new_user.name)
  end

  it 'lists the profile picture for each users' do
    expect(page).to have_all_of_selectors('.user-photo')
  end

  it 'lists the number of posts of the user' do
    expect(page).to have_content('Number of posts:')
    expect(page).to have_content(new_user.posts_counter)
  end

  it 'the name of the user redirects to the user\'s show page' do
    click_link(href: user_path(new_user))
    expect(page).to have_current_path(user_path(new_user))
  end
end
