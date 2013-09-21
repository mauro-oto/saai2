class UsersController < ApplicationController
	before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def menu
  end

  def ranking
  	@usersPuntosPublicos = User.order("puntosPublicos desc").limit(3)
  	@usersPuntosPrivados = User.order("puntosPrivados desc").limit(3)
  end
  
end
