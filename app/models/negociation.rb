class Negociation < ApplicationRecord
  belongs_to :ad
  belongs_to :colaborator
  validates :ask, presence:{message: 'Proposta não pode ficar em branco'}
end
