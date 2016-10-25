class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :phone
      t.string :website
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
