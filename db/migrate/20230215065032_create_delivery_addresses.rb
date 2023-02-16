class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.integer :customer_id, null: false, default: ""
      t.string :post_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :addressee, null: false, default: ""

      t.timestamps
    end
  end
end
