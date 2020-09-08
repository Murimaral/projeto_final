class Payment < ApplicationRecord
  belongs_to :colaborator
  belongs_to :ad
  before_create :generate_token

  
private 
def generate_token
  self.token = SecureRandom.alphanumeric(6).upcase 
end

end
