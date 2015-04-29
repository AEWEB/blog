class CreateTaskHistories < ActiveRecord::Migration
  def change
    create_table :task_histories do |t|
      t.text :memo
      t.references :task, null: false, index: true
      t.foreign_key :tasks, dependent: :delete
      t.timestamps
    end
  end
end
