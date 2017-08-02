class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :title
      t.string :comment
      t.timestamps null: false
    end
  end
end
