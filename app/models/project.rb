class Project < ActiveRecord::Base
  validates_presence_of :name

  has_many :workhours, dependent: :delete_all
  has_many :users, :through => :workhours
  

end
