class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :workhours
  has_many :projects, :through => :workhours
  
  validates_presence_of :full_name, :email, :password, :password_confirmation, :on => :create
  validates_presence_of :full_name, :email, :on => :update
 
  
end
