class Workhour < ActiveRecord::Base
  validates_presence_of :hours, :project_id
  
  belongs_to :user
  belongs_to :project
end
