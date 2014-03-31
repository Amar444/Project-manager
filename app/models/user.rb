class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :full_name
  
  #Set the first user as admin       
  after_create :set_role
  private
  def set_role
    if User.count == 1
      User.first.update_attribute(:role, "admin")
    else
      return true
    end   
  end
  
end
