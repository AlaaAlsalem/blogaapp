class LikesController < ApplicationController
  def new
    @new_like = Like.new
  end

  def create
    @new_like = Like.new(user: @user, post: @post)

    ActiveRecord::Base.transaction do
      if @new_like.save
        @post.increment!(:LikesCounter)
        flash[:notice] = 'Like created successfully!'
      else
        flash[:alert] = 'An error occurred while creating the like'
      end
    end

    redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
  end
end
