class CreateBookingPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_photos do |t|
      t.jsonb :image_data, index: true, using: :gin
      t.timestamps
    end
  end
end
