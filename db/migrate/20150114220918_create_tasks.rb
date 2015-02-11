class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :goal
      t.string :memo
      t.datetime :start_time
      t.datetime :end_time
      t.integer :security
      t.integer :state
      t.integer :priority
      t.references :user, null: false, index: true
      t.foreign_key :users, dependent: :delete
      t.timestamps
    end
  end
end
