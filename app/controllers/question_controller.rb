class QuestionController < ApplicationController
    
    get "/questions/all" do
        @questions = Question.order(created_at: :desc)
        erb :'questions/all'
    end

    post "/questions/all" do
        
        @jurisdiction = params[:jurisdiction]
        @area = params[:area]
        @questions = []
        
        if !@area.empty? && !@jurisdiction.empty?
            Question.order(created_at: :desc).each do |q|
                if q.area == @area && q.jurisdiction == @jurisdiction
                    @questions << q
                end
            end
        elsif !@area.empty? && @jurisdiction.empty?
            Question.order(created_at: :desc).each do |q| 
                if q.area == @area
                    @questions << q 
                end
            end
        elsif !@jurisdiction.empty? && @area.empty?
            Question.order(created_at: :desc).each do |q| 
                if q.jurisdiction == @jurisdiction
                    @questions << q
                end
            end
        end

        erb :'questions/all'
    end
end