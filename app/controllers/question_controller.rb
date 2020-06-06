class QuestionController < ApplicationController
    
    get "/questions/all" do
        @questions = Question.order(created_at: :desc)
        erb :'questions/all'
    end

    post "/questions/all" do
        @questions = Question.order(created_at: :desc)
    
        erb :'questions/all'
    end
end