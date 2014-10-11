class CreateProjectTasks < ActiveRecord::Migration
  def change
    create_table :project_tasks do |t|
      t.references :project, index: true,null: false
      t.foreign_key :projects, dependent: :delete
      t.references :task, index: true,null: false
      t.foreign_key :tasks, dependent: :delete
      t.timestamps
    end
  end
end
