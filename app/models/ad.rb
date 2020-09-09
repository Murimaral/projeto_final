class Ad < ApplicationRecord
  belongs_to :colaborator
  has_many :questions, dependent: :destroy
  has_one :deal, dependent: :destroy
  validates :name, :category, :cost, presence: true

  enum status: {available:0, disab:1, sold:2}
end
