class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message, null: false
      t.string :mattermost_times_url, null: false
      t.string :image

      t.timestamps
    end
  end
end
