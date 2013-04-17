class FixCommentColName < ActiveRecord::Migration
  def up
  	rename_column :comments, :comment, :content
  end

  def down
  	rename_column :comments, :content, :comment
  end
end
