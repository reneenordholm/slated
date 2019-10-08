class CreateConcierges < ActiveRecord::Migration[6.0]
  def change
    create_table :concierges do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :name
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
