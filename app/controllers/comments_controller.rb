class CommentsController < ApplicationController
  before_filter :load_post

  def index
  end

  def show
  end

  def new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :feed
    else
      flash.now[:alert] = "Cannot post an empty comment"
      render "posts/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
