class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.string :address_building
      t.integer :price
      t.string :image_name
      t.integer :person_num

      t.timestamps
    end
  end
end
