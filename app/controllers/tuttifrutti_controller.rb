class TuttifruttiController < ApplicationController
  def index
  	@lists = List.where(user_id: current_user.id).first(5)
  	for i in 0..@lists.length
  		@filas[i] = Fila.where(list_id: @lists[i].id)
  	end
  end
end
