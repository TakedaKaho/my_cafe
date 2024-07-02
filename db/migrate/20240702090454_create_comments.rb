class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :cafe_id, null:false
      t.integer :user_id, null:false
      t.integer :star, null:false
      t.string :comment, null:false

      t.timestamps
    end
  end
end
