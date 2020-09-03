class Ad < ApplicationRecord
  belongs_to :colaborator
  has_many :questions
  validates :name, :category, :cost, presence: true
  
end
