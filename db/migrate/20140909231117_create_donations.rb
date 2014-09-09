class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :nonprofit
      t.integer :amount
      t.string :name
      t.string :email
      t.timestamps
    end
  end
end
