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
        if user_is_a? == "client" && logged_in?
            erb :'questions/new'
        elsif user_is_a? == "lawyer" && logged_in?
            redirect "/questions/all"
        else
            redirect "/"
        end
    end

    post "/questions/new" do
        
        @question = current_user.questions.create(title: params[:title], description: params[:description], area: params[:area], jurisdiction: params[:jurisdiction])
        
        redirect "/questions/#{@question.slug}"
            
    end

    get "/questions/:slug" do
       
        @question = Question.find_by_slug(params[:slug])
        @answers = @question.answers.sort {|a, b| b.upvotes <=> a.upvotes}
        @user_type = session[:user_type]
        @current_user = current_user
        
        erb :'questions/show'
    end

    post "/questions/:slug" do
        
        @question = Question.find_by_slug(params[:slug])
        @answer = @question.answers.create(content: params[:content])
        @answer.lawyer = current_user
        @answer.save
     
        redirect "/questions/#{params[:slug]}"
    end

    get "/questions/:slug/edit" do
        @question = Question.find_by_slug(params[:slug])
        erb :'questions/edit'
    end

    patch "/questions/:slug" do
        
        @question = Question.find_by_slug(params[:slug])
        @question.update(title: params[:title], description: params[:description], jurisdiction: params[:jurisdiction], area: params[:area])
        
        redirect "/questions/#{params[:slug]}"
    end

    delete "/questions/:slug" do
        
        @question = Question.find_by_slug(params[:slug])
        @question.destroy
     
        redirect "/questions/user"
    end

    post "/questions/:slug/answers/:id" do
        @answer = Answer.find(params[:id])
        
        if !params[:upvote].empty?
            @answer.increment!(:upvotes)
            @answer.lawyer.increment!(:upvotes)
            @answer.save
        end
        
        redirect "/questions/#{params[:slug]}"
    end

    delete "/questions/:slug/answers/:id" do
        @answer = Answer.find(params[:id])
        @answer.destroy
        redirect "/questions/#{params[:slug]}"
    end

   
    
end