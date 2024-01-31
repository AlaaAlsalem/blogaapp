class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      flash[:notice] = 'The post was successfully submitted.'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = "Can not save the post. Errors: #{formatted_errors(@post)}"
      render :new
    end
  end

  private

  def formatted_errors(resource)
    resource.errors.full_messages.join(', ')
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
