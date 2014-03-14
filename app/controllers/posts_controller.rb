class PostsController < ApplicationController
    def index
      @posts = Post.where("degree <= ?", current_user.degree)
      @post = Post.new
    end
  
    def show
    end
  
    def new
    end
  
    def create
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end
end
