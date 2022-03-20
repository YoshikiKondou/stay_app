class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :total_price

      t.timestamps
    end
  end
end
