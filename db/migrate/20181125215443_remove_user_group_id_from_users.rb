class RemoveUserGroupIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_groups_id, :integer
  end
end
