class FilasController < ApplicationController

def create
    @list = List.find(params[:list_id])
    @fila = @list.filas.create(params[:fila].permit(:palabra, :significado, :idiomaNativo, :idiomaForaneo, :imagen, :audio, :sinonimos, :antonimos))
    redirect_to list_path(@list)
end

def update
	@fila = Fila.find(params[:id])

  p = { params[:name] => params[:value] }

	respond_to do |format|
		if @fila.update_attributes(p)
			format.html { redirect_to @fila, notice: 'Fila was successfully updated.'}
			format.json { render json: @fila }
		else
			format.html { render action: "edit"}
			format.json { render json: @fila.errors, status: :unproccessable_entity }
		end
	end
end

def destroy
  @fila = Fila.find(params[:id])
  @list = List.find(params[:list_id])
  @fila.destroy
  redirect_to list_path(@list)
end

end
