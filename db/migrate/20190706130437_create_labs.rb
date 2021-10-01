class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.date :pdt_date
      t.string :title,              null: false, default: ""
      t.text :content
      t.integer :order

      t.timestamps null: false
    end
  end
end
