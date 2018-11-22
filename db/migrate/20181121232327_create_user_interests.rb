class CreateUserInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_interests do |t|
      t.integer :user_id
      t.string :type
      t.integer :interest_level
      t.integer :group_id

      t.timestamps
    end
  end
end
