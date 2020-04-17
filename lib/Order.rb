class Order < ActiveRecord::Base

    belongs_to :chef
    belongs_to :customer

    def to_s
        "Hi! This is your Order Number:#{id} and your Order: #{pizza_order}"
    end

end