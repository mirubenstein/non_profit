class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :nonprofit
      t.integer :amount
      t.string :interval, default: 'month'
      t.string :long_name
      t.string :currency, default: 'usd'
      t.string :short_name
    end
  end
end
