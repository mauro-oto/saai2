class CreateFilas < ActiveRecord::Migration
  def change
    create_table :filas do |t|
      t.string :palabra
      t.string :significado
      t.string :idiomaNativo
      t.string :idiomaForaneo
      t.string :imagen
      t.string :audio
      t.string :sinonimos
      t.string :antonimos

      t.timestamps
    end
  end
end
