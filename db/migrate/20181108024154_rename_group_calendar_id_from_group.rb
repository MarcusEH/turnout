class RenameGroupCalendarIdFromGroup < ActiveRecord::Migration[5.2]
  def change
    rename_column :groups, :group_calendar_id, :group_event_id
  end
end
