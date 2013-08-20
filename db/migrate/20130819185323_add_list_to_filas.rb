class AddListToFilas < ActiveRecord::Migration
  def change
    add_reference :filas, :list, index: true
  end
end
