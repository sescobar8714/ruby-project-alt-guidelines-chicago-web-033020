class CreateOrdersTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :orders do |t|
            t.integer :chef_id
            t.integer :customer_id
            t.string :pizza_order
            t.timestamp 
        end
    end 
end 