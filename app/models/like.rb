class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  attribute :LikesCounter, :integer, default: 0
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:LikesCounter)
  end
end
