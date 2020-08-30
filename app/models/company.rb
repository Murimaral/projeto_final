class Company < ApplicationRecord
    validates :name, :cnpj, :domain, presence: true
    validate :cnpj_valido

    def cnpj_valido
        if cnpj.present? && !CNPJ.valid?(cnpj) 
            errors.add(:cnpj, 'CNPJ inválido')  
        end
    end
end
