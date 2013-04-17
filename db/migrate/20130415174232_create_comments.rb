class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :piece_id
      t.integer :user_id
      t.string :user
      t.text :comment

      t.timestamps
    end
  end
end
