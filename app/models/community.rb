class Community < ApplicationRecord
    #relationships
    has_many :members
    has_many :posts
    has_many :users, through: :members

    #validations
    validates :name, presence: true, uniqueness: true, length: {minimum: 3}

    #scopes
    scope :non_private, -> {where(private: false)}
end
