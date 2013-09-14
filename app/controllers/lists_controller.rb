class ListsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @list = current_user.lists.build
  end
  
  def index
  @lists = current_user.lists
  end
  
  def create
  @list = List.new(list_params)
  @list.user_id = current_user.id
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

  def destroy
  @list = List.find(params[:id])
  @list.destroy
 
  redirect_to lists_path
  end
  
  private
  def list_params
    params.require(:list).permit(:nombre, :idiomaNativo, :idiomaForaneo)
  end

  def set_list
    @list = current_user.lists.find(params[:id])
  end

end
