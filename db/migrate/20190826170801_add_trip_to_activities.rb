class AddTripToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :trip, foreign_key: true
  end
end
