class RemoveGroupIdFromUserInterests < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_interests, :group_id, :integer
  end
end
