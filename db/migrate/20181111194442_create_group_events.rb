class CreateGroupEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :group_events do |t|
      t.integer :group_id
      t.datetime :time_slot
      t.string :location

      t.timestamps
    end
  end
end
