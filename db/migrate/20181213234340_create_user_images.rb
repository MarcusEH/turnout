class CreateUserImages < ActiveRecord::Migration[5.2]
  def change
    create_table :user_images do |t|
      t.integer :user_id
      t.text :image_file
      t.string :url

      t.timestamps
    end
  end
end
