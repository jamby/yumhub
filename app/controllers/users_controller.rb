class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @nom = Nom.new
    @noms = Nom.where(user_id: User.find(@user))
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  
  def following
    @user = User.find(params[:id])
    @following = @user.all_following
  end
  
end
