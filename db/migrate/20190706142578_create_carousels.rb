class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.string :title,              null: false, default: ""
      t.string :photo,              null: false, default: ""

      t.timestamps null: false
    end
  end
end
