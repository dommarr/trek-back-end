class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :activity, :activity_title
  end
end
