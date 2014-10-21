class AddColumnTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_task_category_id, :integer,:null => false
    add_foreign_key :tasks, :project_task_categories
  end
end
