class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :country, null: false
      t.string :city

      t.timestamps
    end
  end
end
