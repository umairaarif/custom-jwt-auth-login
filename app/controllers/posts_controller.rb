class PostsController < ApplicationController
    before_action :authenticate_request
    before_action :set_post, only: [:show, :update, :destroy]
  
    def index
      @posts = current_user.posts
      render json: @posts
    end
  
    def show
      render json: @post
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post.destroy
      head :no_content
    end
  
    private
  
    def set_post
      @post = current_user.posts.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
end  