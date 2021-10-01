class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.date :pdt_date
      t.string :title,              null: false, default: ""
      t.text :content

      t.timestamps null: false
    end
  end
end
