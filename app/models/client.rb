class Client < ActiveRecord::Base
  
    has_secure_password
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    
    has_many :questions
    has_many :answers, through: :questions
  
end