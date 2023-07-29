class Community < ApplicationRecord
    #relationships
    has_many :members
    has_many :users, through: :members
    
    #validations
end
