class CreateWorkSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :work_schedules do |t|
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time
      t.integer :stylist_id

      t.timestamps
    end
  end
end
