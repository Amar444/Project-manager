class Project < ActiveRecord::Base
  validates_presence_of :name

  has_many :workhours, dependent: :delete_all
  has_many :users, :through => :workhours
  
  def workhours_by_user(user_id) 
    workhours.select{ |hours| hours.user_id == user_id }   
  end
  

end
