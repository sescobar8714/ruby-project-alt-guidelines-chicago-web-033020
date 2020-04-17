class CreateCustomersTable < ActiveRecord::Migration[5.1]

    def change 
        create_table :customers do |t|
            t.string :name
            t.timestamp 
        end
    end 
end 