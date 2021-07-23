class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :message, null: false
      t.datetime :start_datetime, null: false
      t.datetime :finish_datetime, null: false
      t.integer :rule, null: false, default: 0
      t.integer :max_crews, null: false

      t.timestamps
    end
  end
end
