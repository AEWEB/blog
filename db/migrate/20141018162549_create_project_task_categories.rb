class CreateProjectTaskCategories < ActiveRecord::Migration
  def change
    create_table :project_task_categories do |t|
      t.references :project, index: true,null: false
      t.foreign_key :projects, dependent: :delete
      t.references :task_category, index: true,null: false
      t.foreign_key :task_categories, dependent: :delete
      t.timestamps
    end
  end
end
