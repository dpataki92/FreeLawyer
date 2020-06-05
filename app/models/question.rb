class Question < ActiveRecord::Base
    include Slugifiable
    
    has_many :answers
    belongs_to :client
  
end