class Workhour < ActiveRecord::Base
  validates_presence_of :hours, :project_id
  validates :hours, :inclusion => { in: 0..24 } 
  
  belongs_to :user
  belongs_to :project
end
