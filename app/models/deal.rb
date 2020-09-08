class Deal < ApplicationRecord
  belongs_to :ad
  belongs_to :colaborator
  has_one :payment
  enum deliver_diff_ad: {same_address: 0, another_address: 1}  
  enum pay_met: {creditcard: 0, billet: 1} 


end
