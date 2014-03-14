class PostsController < ApplicationController
    def index
      @posts = Post.where("degree <= ?", current_user.degree).order(created_at: :desc)
      @post = Post.new
    end
  
    def show
    end
  
    def new
    end
  
    def create
      @post = Post.create(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to(:feed, notice: "Posted")
      else
        flash.now[:alert] = "Post failed"
        render "new"
      end
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    private
    def post_params
        params.require(:post).permit(:degree, :content)
    end
end
