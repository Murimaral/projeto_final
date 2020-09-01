class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :colaborator
  has_one :company
  has_many :ad, through: :colaborator
   enum permission: {visitor: 0, colab: 1, admin: 2}      
end
