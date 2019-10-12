class RemoveColumnUsernameFromConcierge < ActiveRecord::Migration[6.0]
  def change
    remove_column :concierges, :username, :string
  end
end
