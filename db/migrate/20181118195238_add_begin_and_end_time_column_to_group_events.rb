class AddBeginAndEndTimeColumnToGroupEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :group_events, :begin_time, :datetime
    add_column :group_events, :end_time, :datetime
    remove_column :group_events, :time_slot, :datetime
  end
end
