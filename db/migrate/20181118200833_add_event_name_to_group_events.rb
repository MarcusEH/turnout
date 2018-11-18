class AddEventNameToGroupEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :group_events, :event_name, :string
  end
end
