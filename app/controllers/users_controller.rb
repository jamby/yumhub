class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @nom = Nom.new
    @noms = Nom.where(user_id: User.find(@user))
  end
  
end
