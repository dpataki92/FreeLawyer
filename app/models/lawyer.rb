class Lawyer < ActiveRecord::Base
  
    has_secure_password
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    
    has_many :answers
    has_many :questions, through: :answers
  
end