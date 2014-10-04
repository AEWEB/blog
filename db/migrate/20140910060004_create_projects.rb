class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :purpose
      t.datetime :start_time
      t.datetime :end_time
      t.integer :security
      t.integer :project_type
      t.text :memo
      t.timestamps
    end
  end
end
