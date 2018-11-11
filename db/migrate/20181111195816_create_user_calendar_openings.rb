class CreateUserCalendarOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_calendar_openings do |t|
      t.integer :user_id
      t.datetime :begin_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
