class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city, null: false
      t.string :state, null: false
      t.string :street
      t.integer :zip

      t.timestamps
      t.belongs_to :location
    end
  end
end
