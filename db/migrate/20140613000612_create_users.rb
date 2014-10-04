class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, :null => false
      t.string :mail, :null => false
      t.integer :device, :null => false
      t.string :password, :null => false
      t.timestamps
    end
  end
end
