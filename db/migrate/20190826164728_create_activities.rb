class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.datetime :begin_date, null: false
      t.datetime :end_date, null: false
      t.string :activity, null: false

      t.timestamps
    end
  end
end
