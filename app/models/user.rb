class User < ActiveRecord::Base
  has_secure_password
  validates :email, :uniqueness => true, :length => {:minimum => 5, :maximum => 40}
  validates_format_of :email, :with => 
/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


  validates :username, :password, :length => {:minimum => 5, :maximum => 15}

  attr_accessible :email, :username, :password, :password_confirmation
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments, :allow_destroy => true
end
