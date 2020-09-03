class Question < ApplicationRecord
  belongs_to :ad
  validates :ask, presence:true
end
