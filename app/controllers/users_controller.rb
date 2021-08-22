class UsersController < ApplicationController


  def index
    users = User.all
    render json: { users: users }
  end
  
  # def show
  #   user = User.find(params[:id]).posts
  #   render json: { posts: user }
  # end

  def show
    user = User.find(params[:id])
    render json: { user: user }
  end

  def create
    user = User.create(user_params)
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    User.destroy(params[:id])
    render json: { notice: 'User was successfully removed.'}
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :email, :password)
  end

end