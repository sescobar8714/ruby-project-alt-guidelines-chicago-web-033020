class CreateChefsTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :chefs do |t|
            t.string :name
            t.integer :num_of_orders_completed
        end
    end 
end