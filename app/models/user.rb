class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :courses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name, :last_name, :email, presence: true

         
  def teacher?
    role == "teacher"
   end
         
end