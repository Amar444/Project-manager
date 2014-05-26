class AddIsActiveToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :is_active, :boolean, :default => true
  end

  def self.down
    remove_column :projects, :is_active
  end
end
