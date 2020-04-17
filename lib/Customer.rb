class Customer < ActiveRecord::Base

    has_many :orders
    has_many :chefs, through: :orders

    def to_s
        "#{name}"

    end

end 