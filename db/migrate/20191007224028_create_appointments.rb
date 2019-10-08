class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :service_id
      t.integer :concierge_id
      t.integer :stylist_id
      t.integer :client_id

      t.timestamps
    end
  end
end
