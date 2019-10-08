class CreateStylists < ActiveRecord::Migration[6.0]
  def change
    create_table :stylists do |t|
      t.string :name
      t.datetime :avail_start
      t.datetime :avail_end

      t.timestamps
    end
  end
end
