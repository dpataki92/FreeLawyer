class QuestionController < ApplicationController
    
    get "/questions/all" do
        @questions = Question.all
        erb :'questions/all'
    end
end