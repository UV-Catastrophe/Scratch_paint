class ChangeUserColumnNameComment < ActiveRecord::Migration
  def up
  	rename_column :comments, :user, :handle
  end

  def down
  end
end
