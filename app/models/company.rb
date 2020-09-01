class Company < ApplicationRecord
    validates :name, :cnpj, :domain, presence: true
    validate :cnpj_valido
    has_many :colaborators
    has_many :ads, through: :colaborator 
    has_many :users
    def cnpj_valido
        if cnpj.present? && !CNPJ.valid?(cnpj) 
            errors.add(:cnpj, 'CNPJ inválido')  
        end
    end
end
