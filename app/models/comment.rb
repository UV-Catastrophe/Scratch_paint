class Comment < ActiveRecord::Base
  attr_accessible :content, :piece_id, :handle, :created_at, :user_id
  belongs_to :piece
  belongs_to :user

end
