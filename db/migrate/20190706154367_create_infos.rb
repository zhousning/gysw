class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.date :pdt_date
      t.string :title,              null: false, default: ""
      t.text :content 
      t.string :category,              null: false, default: ""

      t.timestamps null: false
    end
  end
end
