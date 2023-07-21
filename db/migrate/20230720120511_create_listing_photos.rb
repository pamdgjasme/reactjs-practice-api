class CreateListingPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_photos do |t|
      t.references :listing, index: true
      t.jsonb :image_data, index: true, using: :gin
      t.timestamps
    end
  end
end
