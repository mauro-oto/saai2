class ListsController < ApplicationController

  def new
  end
  
  def index
  @lists = List.all
  end
  
  def create
  @list = List.new(list_params)
  @list.save
  
  redirect_to @list
  end
  
  def show
  @list = List.find(params[:id])
  end
  
  def edit
  @list = List.find(params[:id])
  end
  
  def update
  @list = List.find(params[:id])  
 
  if @list.update(params[:list].permit(:nombre, :idiomaNativo, :idiomaForaneo))
    redirect_to @list
  else
    render 'edit'
  end
  end
  
  private
  def list_params
    params.require(:list).permit(:nombre, :idiomaNativo, :idiomaForaneo)
  end

end
