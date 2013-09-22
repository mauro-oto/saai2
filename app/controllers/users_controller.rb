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
  	@usersLists = User.find_by_sql("SELECT users.nombre, count(lists.user_id) AS cantidad 
  		FROM users INNER JOIN lists ON users.id = lists.user_id 
  		GROUP BY users.nombre 
  		ORDER BY cantidad Desc;")
  end
  
end
