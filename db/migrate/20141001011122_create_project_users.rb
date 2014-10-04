class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.references :user, index: true,null: false
      t.foreign_key :users, dependent: :delete
      t.references :project, index: true,null: false
      t.foreign_key :projects, dependent: :delete
      t.integer :status
      t.timestamps
    end
  end
end
