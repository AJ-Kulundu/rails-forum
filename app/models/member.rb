class Member < ApplicationRecord
  belongs_to :user
  belongs_to :community

  #Enums
  enum role: %i[member admin]
end
