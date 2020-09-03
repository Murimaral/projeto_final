class Colaborator < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :ad
  has_many :questions, through: :ads 

  validates :name, :social_name, :birth_date, :cpf,
            :address, :role, presence: true
  validate :cpf_valido



  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf) 
      errors.add(:cpf, 'CPF inválido') 
    
    end  
    
  end           



end
