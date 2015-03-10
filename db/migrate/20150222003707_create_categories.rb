class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :user, null: false, index: true
      t.foreign_key :users, dependent: :delete
      t.timestamps
    end
  end
end
