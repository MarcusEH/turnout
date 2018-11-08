class ChangeGroupIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :group_id, :user_groups_id
  end
end
