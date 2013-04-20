class HomeController < ApplicationController
  def index
    @nom = Nom.new
    @noms = Nom.all
  end
end
