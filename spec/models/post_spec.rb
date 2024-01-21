require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:author).class_name('User') }
  it { should have_many(:comments) }
  it { should have_many(:likes) }

  # Test callbacks
  describe 'after_save' do
    let(:post) { create(:post) }
    let(:author) { post.author }

    it 'should call update_posts_counter' do
      expect(post).to receive(:update_posts_counter)
      post.save
    end

    it 'should increment posts_counter of the author' do
      expect { post.save }.to change { author.reload.posts_counter }.by(1)
    end
  end

  # Test validations
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

  # Test private methods
  describe 'private methods' do
    let(:post) { create(:post) }

    describe '#update_posts_counter' do
      let(:author) { post.author }

      it 'should increment posts_counter of the author' do
        expect { post.send(:update_posts_counter) }.to change { author.reload.posts_counter }.by(1)
      end
    end
  end
  describe 'recent_posts' do
    before(:example) do
      # @user = User.create(name: 'John Doe', photo: 'Person Image', bio: 'I am a teacher', posts_counter: 0)
      @user = User.create(name: 'Tom', photo: 'https://picsum.photos/200/500', bio: 'Teacher from Mexico.')
      @post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
    end

    let!(:comment1) do
      Comment.create(text: 'Comment 1', author: @user, post: @post)
    end
    let!(:comment2) do
      Comment.create(text: 'Comment 1', author: @user, post: @post)
    end
    let!(:comment3) do
      Comment.create(text: 'Comment 3', author: @user, post: @post)
    end
    let!(:comment4) do
      Comment.create(text: 'Comment 4', author: @user, post: @post)
    end
    let!(:comment5) do
      Comment.create(text: 'Comment 5', author: @user, post: @post)
    end

    it 'should return recent 5 photos' do
      expect(@post.five_latest_comments).to eq(5)
    end
  end
end
