class CommentsController < ApplicationController
  before_filter :load_post
  before_filter :require_login

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
      redirect_to "/feed##{@post.id}"
    else
      flash.now[:alert] = "Cannot post an empty comment"
      redirect_to "/posts/#{@post.id}"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to("/feed##{@post.id}")
    else
      flash.now[:alert] = "Edit failed"
      render "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :feed
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end

  def load_post
    @post = Post.find(params[:post_id])
  end
end
