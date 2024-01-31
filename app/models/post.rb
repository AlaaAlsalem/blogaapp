class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  validates :Title, presence: true, length: { maximum: 250 }
  validates :ComentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def five_latest_comments
    comments.order('created_at DESC').limit(5)
  end

  def five_latest_comments
    comments.order('created_at DESC').limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:post_counter)
  end
end
