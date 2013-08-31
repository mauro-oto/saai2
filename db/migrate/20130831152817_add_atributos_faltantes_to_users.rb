class AddAtributosFaltantesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :foto, :string
    add_column :users, :idiomasNativos, :string
    add_column :users, :idiomasAAprender, :string
    add_column :users, :puntosPublicos, :integer
    add_column :users, :puntosPrivados, :integer
  end
end
