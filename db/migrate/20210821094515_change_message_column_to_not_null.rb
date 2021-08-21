class ChangeMessageColumnToNotNull < ActiveRecord::Migration[6.1]
  def up
    change_column :profiles, :message, :text, null: true
  end

  def down
    change_column :profiles, :message, :text, null: false
  end
end
