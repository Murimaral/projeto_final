class Ad < ApplicationRecord
  belongs_to :colaborator
  has_many :questions
  has_many :negociations
  has_one :deal
  validates :name, :category, :cost, presence: true

  
end
