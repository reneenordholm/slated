class RemoveAvailColumnsFromStylists < ActiveRecord::Migration[6.0]
  def change

    remove_column :stylists, :avail_start, :datetime

    remove_column :stylists, :avail_end, :datetime
  end
end
