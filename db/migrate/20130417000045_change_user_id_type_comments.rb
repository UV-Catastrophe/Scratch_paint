class ChangeUserIdTypeComments < ActiveRecord::Migration
  def up
  	change_column :comments, :user_id, :integer
  end

  def down
  end
end
