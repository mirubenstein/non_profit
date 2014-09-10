class UpdateDonation < ActiveRecord::Migration
  def change
    add_column :donations, :token, :string
    remove_column :users, :token
  end
end
