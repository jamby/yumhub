class NomsController < ApplicationController
  respond_to :html, :json
  
  def new
    @nom = Nom.new
  end
  
  def create
    @nom = current_user.noms.build(params[:nom])
    if @nom.save
      flash.now[:success] = "Nom created!"
		else
      flash.now[:error] = @nom.errors.full_messages
      @noms = Nom.all
		end
		respond_to do |format|
      format.js
    end
  end
  
  def show
    @user = User.find_by_username(params[:username])
    @nom = Nom.find_by_id(params[:id])
  end
end
