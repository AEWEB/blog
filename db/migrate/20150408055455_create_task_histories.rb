class CreateTaskHistories < ActiveRecord::Migration
  def change
    create_table :task_histories do |t|
      t.text :memo
      t.datetime :date

      t.timestamps
    end
  end
end
