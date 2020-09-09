class Payment < ApplicationRecord
    belongs_to :deal
    belongs_to :colaborator

  end
  