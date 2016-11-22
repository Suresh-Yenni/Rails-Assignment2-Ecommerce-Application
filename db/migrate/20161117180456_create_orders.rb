class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.references :customers
      t.references :items

      t.timestamps
    end
    add_index :orders, :customers_id
    add_index :orders, :items_id
  end
end
