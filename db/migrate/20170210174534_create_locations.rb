class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :destination, null: false
      t.string :travel_method

      t.timestamps
      t.belongs_to :trip
    end
  end
end
