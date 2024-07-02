class CreateCafes < ActiveRecord::Migration[6.1]
  def change
    create_table :cafes do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.time :hours, null: false
      t.date :days_open, null: false
      t.string :review, null: false
      #緯度
      t.float :latitude , null: false 
      #経度
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
