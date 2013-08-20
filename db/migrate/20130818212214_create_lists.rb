class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :nombre
      t.string :idiomaNativo
      t.string :idiomaForaneo

      t.timestamps
    end
  end
end
