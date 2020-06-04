class Lawyer < ActiveRecord::Base
  
    has_secure_password
    
    has_many :answers
    has_many :questions, through: :answers
  
end