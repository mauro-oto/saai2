class TuttifruttiController < ApplicationController
  def index
  end

  def agregarPuntos
  	current_user.update_attributes(puntosPrivados: current_user.puntosPrivados + params[:puntos_hidden].to_i)
  	redirect_to root_path
  end
end
