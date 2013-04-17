class Category < ActiveRecord::Base
  attr_accessible :name, :pieces_attributes
  has_many :pieces, :dependent => :destroy
  accepts_nested_attributes_for :pieces, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
