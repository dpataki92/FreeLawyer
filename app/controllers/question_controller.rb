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

    get "/questions/new" do
        if user_is_a? == "client"
            erb :'questions/new'
        else
            redirect "/questions/all"
        end
    end

    post "/questions/new" do
        
        @question = current_user.questions.create(title: params[:title], description: params[:description], area: params[:area], jurisdiction: params[:jurisdiction])
        
        redirect "/questions/#{@question.slug}"
            
    end

    get "/question/:slug"
        erb :'questions/show'
    end
end