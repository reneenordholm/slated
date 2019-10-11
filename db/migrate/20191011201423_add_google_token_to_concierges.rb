class AddGoogleTokenToConcierges < ActiveRecord::Migration[6.0]
  def change
    add_column :concierges, :google_token, :string
    add_column :concierges, :google_refresh_token, :string
  end
end
