class Chef < ActiveRecord::Base

    has_many :orders
    has_many :customers, through: :orders

    def to_s
        "#{name}"
    end

end