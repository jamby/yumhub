class NomsController < ApplicationController
  def new
    @nom = Nom.new
  end
  
  def create
    @nom = current_user.noms.build(params[:nom])
    if @nom.save
      flash[:success] = "Nom created!"
      redirect_to root_path
		else
      flash[:error] = @nom.errors.full_messages
      @noms = Nom.all
      redirect_to root_path
		end
  end
  
  def show
    @user = User.find_by_username(params[:username])
    @nom = Nom.find_by_id(params[:id])
  end
end
