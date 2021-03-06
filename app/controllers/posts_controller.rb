class PostsController < ApplicationController
    
  def index
    posts = Post.all
    render json: {posts: posts}
  end
  
  def show
    post = Post.find(params[:id])
    render json: {post: post}
  end

  def create
    post = Post.create(post_params)
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    render json: post
  end

  def destroy
    Post.destroy(params[:id])
    render json: { notice: 'Post was successfully removed.'}
  end

  private

  def post_params
    params.require(:post).permit(:id, :title, :description, :user_id)
  end

end