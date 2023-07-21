class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|

      t.references :listing, index: true
      t.date       :date_from
      t.date       :date_end
      
      t.timestamps
    end
  end
end
