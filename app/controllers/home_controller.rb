class HomeController < ApplicationController
  def index
    @nom = Nom.new
    @noms = Nom.all
    unless current_user.nil?
      @friends_noms = Nom.where(user_id: current_user.following_users.map(&:id))
    end
  end
end
