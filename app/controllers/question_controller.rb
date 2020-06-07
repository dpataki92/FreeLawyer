class QuestionController < ApplicationController
    
    get "/questions/all" do

        if logged_in?
            @questions = Question.order(created_at: :desc)
            erb :'questions/all'
        else
            redirect "/login"
        end

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

    get "/questions/users/:username" do
        
        if logged_in?
            if Client.find_by(username: params[:username])
                @user_to_show = Client.find_by(username: params[:username])
                @user_to_show_type = "client"
                @questions = @user_to_show.questions.order(created_at: :desc)
            elsif Lawyer.find_by(username: params[:username])
                @user_to_show = Lawyer.find_by(username: params[:username])
                @user_to_show_type = "lawyer"
                @questions = @user_to_show.questions.order(created_at: :desc)
            end
        else 
            redirect "/"
        end

        erb :'/questions/user'
   end

    get "/questions/:slug" do
        if logged_in?
            @question = Question.find_by_slug(params[:slug])
            @answers = @question.answers.sort {|a, b| b.upvotes <=> a.upvotes}
            @user_type = session[:user_type]
            
            erb :'questions/show'
        else
            redirect "/"
        end
    end

    post "/questions/:slug" do
        
        @question = Question.find_by_slug(params[:slug])
        @answer = @question.answers.create(content: params[:content])
        @answer.lawyer = current_user
        @answer.save
     
        redirect "/questions/#{params[:slug]}"
    end

    get "/questions/:slug/edit" do
        if logged_in? && current_user.questions.include?(Question.find_by_slug(params[:slug]))
            @question = Question.find_by_slug(params[:slug])
            erb :'questions/edit'
        else
            redirect "/"
        end
    end

    patch "/questions/:slug" do
        
        @question = Question.find_by_slug(params[:slug])
        @question.update(title: params[:title], description: params[:description], jurisdiction: params[:jurisdiction], area: params[:area])
        
        redirect "/questions/#{params[:slug]}"
    end

    delete "/questions/:slug" do
       
        @question = Question.find_by_slug(params[:slug])
        @question.delete
     
        redirect "/questions/users/#{current_user.username}"
    end

    post "/questions/:slug/answers/:id" do
        
        @answer = Answer.find(params[:id])
        
        @answer.increment!(:upvotes)
        @answer.lawyer.increment!(:upvotes)
        
        redirect "/questions/#{params[:slug]}"
    end

    delete "/questions/:slug/answers/:id" do
        
        @answer = Answer.find(params[:id])
        @answer.delete

        redirect "/questions/#{params[:slug]}"
    end

    
    
end