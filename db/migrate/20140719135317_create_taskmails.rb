class CreateTaskmails < ActiveRecord::Migration
  def change
    create_table :taskmails do |t|
      t.string :from
      t.string :address
      t.string :cc
      t.string :bcc
      t.string :subject
      t.text :header
      t.text :text
      t.text :footer
      t.integer :status
      t.integer :type

      t.timestamps
    end
  end
end
