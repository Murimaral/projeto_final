class Ad < ApplicationRecord
  belongs_to :colaborator
  validates :name, :category, :cost, presence: true
  
end
