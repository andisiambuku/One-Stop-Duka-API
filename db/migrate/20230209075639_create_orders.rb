class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :total_amount
      t.string :status
      t.datetime :date
      t.integer :user_id

      t.timestamps
    end
  end
end
