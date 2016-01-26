class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :title
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
