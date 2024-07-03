class CreatePickUps < ActiveRecord::Migration[6.1]
  def change
    create_table :pick_ups do |t|
      t.integer :post_id, null:false
      t.string :title, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
