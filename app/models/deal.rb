class Deal < ApplicationRecord
    belongs_to :ad
    belongs_to :colaborator
    has_one :payment
    def calculate_receipt(x)
       x - discount + freight
    end
  end
  