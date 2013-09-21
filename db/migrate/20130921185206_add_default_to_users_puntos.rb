class AddDefaultToUsersPuntos < ActiveRecord::Migration
  def change
  	change_column :users, :puntosPrivados, :integer, :default => 0
  	change_column :users, :puntosPublicos, :integer, :default => 0
  end
end
