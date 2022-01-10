class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.boolean :accepted

      t.timestamps
    end
  end
end
