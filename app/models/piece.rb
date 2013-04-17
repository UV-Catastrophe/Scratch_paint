class Piece < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :dependent => :destroy
  attr_accessible :category_id, :codename, :description, :dimensions, :title, :comments_attributes
  accepts_nested_attributes_for :comments, :reject_if => lambda { |a| (a[:handle].blank? and a[:user_id].blank?) or a[:content].blank?}, :allow_destroy => true
end
