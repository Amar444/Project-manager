class AddRoleToUsers < ActiveRecord::Migration
  #Roles: user / moderator / admin
  def change
    add_column :users, :role, :string
  end
  
  def self.up
    add_column :users, :role, :string, :default => "user"
  end

  def self.down
    remove_column :users, :role
  end
end
