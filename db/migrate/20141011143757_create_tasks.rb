class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :ta_name
      t.string :ta_goal
      t.string :ta_memo
      t.datetime :ta_start_time
      t.datetime :ta_end_time
      t.string :ta_security
      t.string :ta_status
      t.string :ta_priority

      t.timestamps
    end
  end
end
