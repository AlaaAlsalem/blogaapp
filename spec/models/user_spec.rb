require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', posts_counter: 3) }
  before { subject.save }
  describe 'associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments).with_foreign_key('author_id') }
    it { should have_many(:likes).with_foreign_key('author_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
  end
  describe 'recent_posts' do
    it 'returns up to three most recent posts' do
      post1 = subject.posts.create!(title: 'Post 1', text: 'Hello', created_at: 1.day.ago, comments_counter: 0,
                                    likes_counter: 0)
      post2 = subject.posts.create!(title: 'Post 2', text: 'Toro', created_at: 2.days.ago, comments_counter: 0,
                                    likes_counter: 0)
      post3 = subject.posts.create!(title: 'Post 3', text: 'How are you', created_at: 3.days.ago, comments_counter: 0,
                                    likes_counter: 0)
      subject.posts.create!(title: 'Post 4', text: 'Bonjour', created_at: 4.days.ago, comments_counter: 0,
                            likes_counter: 0)

      expect(subject.three_latest_posts).to eq([post1, post2, post3])
    end
  end
end
