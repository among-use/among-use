class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :message
      t.datetime :start_datetime
      t.datetime :finish_datetime
      t.string :rule
      t.integer :max_crews

      t.timestamps
    end
  end
end
