class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable

  #relationsips
  has_many :members
  has_many :posts
  has_many :communities, through: :members
  has_many :communities, through: :posts



  def name
    email.split('@').first.capitalize
  end

end
