class RenameTypetoCategoryFromUserInterest < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_interests, :type, :category
  end
end
