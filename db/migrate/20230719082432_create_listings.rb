class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      
      t.string  :name
      t.string  :grade
      t.decimal :fees, precision: 8, scale: 2
      t.text    :description

      t.timestamps
    end
  end
end
