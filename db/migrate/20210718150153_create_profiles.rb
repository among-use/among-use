class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message
      t.string :mattermost_times_url
      t.string :image

      t.timestamps
    end
  end
end
