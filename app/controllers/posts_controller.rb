class PostsController < ApplicationController
    before_filter :require_login

    def index
      if params[:degree]
        @posts = Post.where("degree = ?", params[:degree]).order(created_at: :desc)    
      else
        @posts = Post.where("degree <= ?", current_user.profile.degree).order(created_at: :desc)
      end
      @post = Post.new
      render stream: true
    end
  
    def show
      @post = Post.find(params[:id])
      @comments = Comment.where("post_id = ?", params[:id])
      @comment = @post.comments.build
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.create post_params
      @post.user_id = current_user.id

      if @post.save
        redirect_to(:feed, notice: "Posted")
      else
        flash.now[:alert] = "Post failed"
        render "new"
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])

      if @post.update_attributes(post_params)
        redirect_to(:feed, notice: "Updated.")
      else
        flash.now[:alert] = "Edit failed"
        render "edit"
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy

      redirect_to :feed
    end

    private
    def post_params
        params.require(:post).permit(:degree, :content, :tag_list)
    end
end
