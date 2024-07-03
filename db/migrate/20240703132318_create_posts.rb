class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :hours, null: false
      t.string :days_open, null: false
      t.string :review, null: false
      #緯度
      #t.float :latitude , null: false 
      #経度
      #t.float :longitude, null: false

      t.timestamps
    end
  end
end
