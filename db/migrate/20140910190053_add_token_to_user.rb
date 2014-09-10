class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    remove_column :donations, :name
    remove_column :donations, :email
  end
end
