class CreateWorkhours < ActiveRecord::Migration
  def change
    create_table :workhours do |t|
      t.decimal :hours
      t.string :note
      t.date :date_of_workhour
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
