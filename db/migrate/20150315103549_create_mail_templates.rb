class CreateMailTemplates < ActiveRecord::Migration
  def change
    create_table :mail_templates do |t|
      t.string :from
      t.string :to
      t.string :cc
      t.string :bcc
      t.string :subject
      t.string :header
      t.string :body
      t.string :footer
      t.integer :type

      t.timestamps
    end
  end
end
