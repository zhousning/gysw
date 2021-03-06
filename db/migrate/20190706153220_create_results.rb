class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.date :pdt_date
      t.string :title,              null: false, default: ""
      t.text :content
      t.integer :order

      t.timestamps null: false
    end
  end
end
