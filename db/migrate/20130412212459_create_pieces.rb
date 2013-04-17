class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :category_id
      t.string :codename
      t.string :title
      t.text :description
      t.string :dimensions

      t.timestamps
    end
  end
end
