class CreateGroupImages < ActiveRecord::Migration[5.2]
  def change
    create_table :group_images do |t|
      t.integer :group_id
      t.string :url

      t.timestamps
    end
  end
end
