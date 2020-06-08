class UserController < ApplicationController

    get "/signup/client" do
        if !logged_in?
            flash[:failure] if flash[:failure]
            erb :'users/signup_client'
        else
            redirect "/questions/all"
        end
    end

    get "/signup/lawyer" do
        if !logged_in?
            flash[:failure] if flash[:failure]
            erb :'users/signup_lawyer'
        else
            redirect "/questions/all"
        end
    end

    post "/signup/client" do
        @client = Client.new(username: params[:username], email: params[:email], password: params[:password])
        
        if !Lawyer.find_by(username: params[:username]) && @client.valid?
            @client.save 
            flash[:success] = "You have successfuly signed up!"
            session[:user_type] = "client"
            session[:client_id] = @client.id
            
            redirect "/questions/all"
        else
            flash[:failure] = "Sorry, this username or email has already been taken :("
            redirect "/signup/client"
        end
    end

    post "/signup/lawyer" do
        @lawyer = Lawyer.new(username: params[:username], email: params[:email], password: params[:password], jurisdiction: params[:jurisdiction], expertise: params[:expertise])
        
        if !Client.find_by(username: params[:username]) && @lawyer.valid?
            @lawyer.save
            flash[:success] = "You have successfuly signed up!"
            session[:user_type] = "lawyer"
            session[:lawyer_id] = @lawyer.id
            
            redirect "/questions/all"
        else
            flash[:failure] = "Sorry, this username or email has already been taken :("
            redirect "/signup/lawyer"
        end
    end

    get "/login" do
        if !logged_in?
            flash[:failure] if flash[:failure]
            erb :'users/login'
        else
            redirect "questions/all"
        end
    end

    post "/login" do
       
        session[:user_type] = params[:user_type]

        if params[:user_type] == "client"
            @client = Client.find_by(username: params[:username])
            if @client && @client.authenticate(params[:password])
                session[:client_id] = Client.find_by(username: params[:username]).id
                flash[:success] = "You are successfully logged in!"
            else
                flash[:failure] = "Sorry, username or password is invalid!"
                redirect "/login"
            end
        elsif params[:user_type] == "lawyer"
            @lawyer = Lawyer.find_by(username: params[:username])
            if @lawyer && @lawyer.authenticate(params[:password])
                session[:lawyer_id] = Lawyer.find_by(username: params[:username]).id
                flash[:success] = "You are successfully logged in!"
            else
                flash[:failure] = "Sorry, username or password is invalid!"
                redirect "/login"
            end
        else
            redirect "/login"
        end
        
        redirect "/questions/all"
    end

    get "/lawyers" do
        @lawyers = Lawyer.order(upvotes: :desc)
        
        erb :'/users/lawyers'
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect "/"
        else
            redirect '/'
        end
    end

    get "/delete" do
        current_user.destroy
        session.clear
        flash[:success] = "You have successfully deleted your account!"
        redirect "/"
    end
end