class Ad < ApplicationRecord
  belongs_to :colaborator
  has_many :questions
  has_many :negociations
  has_one :deal
  validates :name, :category, :cost, presence: true

  enum status: {available:0, disab:1, sold:2}
end
