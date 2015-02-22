class AddColumnCategories < ActiveRecord::Migration
  def change
    change_table :tasks do |t|      
      t.references :category, index: true
      t.foreign_key :categories, dependent: :delete
    end
  end
end
