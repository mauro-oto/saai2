class RemoveIdiomaNativoFromFilas < ActiveRecord::Migration
  def change
    remove_column :filas, :idiomanativo, :string
    remove_column :filas, :idiomaforaneo, :string
  end
end
