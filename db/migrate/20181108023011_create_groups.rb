class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :event_type
      t.integer :group_calendar_id

      t.timestamps
    end
  end
end
