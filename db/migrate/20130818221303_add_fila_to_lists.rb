class AddFilaToLists < ActiveRecord::Migration
  def change
    add_reference :lists, :fila, index: true
  end
end
