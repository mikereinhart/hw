class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :description
      t.string :director
      t.string :writer

      t.timestamps
    end
  end
end
