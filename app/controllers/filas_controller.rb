class FilasController < ApplicationController

def create
    @list = List.find(params[:list_id])
    @fila = @list.filas.create(params[:fila].permit(:palabra, :significado, :idiomaNativo, :idiomaForaneo, :imagen, :audio, :sinonimos, :antonimos))
    redirect_to list_path(@list)
  end

end
