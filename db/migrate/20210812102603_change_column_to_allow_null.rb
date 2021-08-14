class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :profiles, :mattermost_times_url,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :profiles, :mattermost_times_url,:string, null: false
  end
end
