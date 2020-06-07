class UserController < ApplicationController

    get "/signup/client" do
        if !logged_in?
            erb :'users/signup_client'
        else
            redirect "/questions/all"
        end
    end

    get "/signup/lawyer" do
        if !logged_in?
            erb :'users/signup_lawyer'
        else
            redirect "/questions/all"
        end
    end

    post "/signup/client" do
        @client = Client.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_type] = "client"
        session[:client_id] = @client.id
        
        redirect "/questions/all"
    end

    post "/signup/lawyer" do
        @lawyer = Lawyer.create(username: params[:username], email: params[:email], password: params[:password], jurisdiction: params[:jurisdiction], expertise: params[:expertise])
        session[:user_type] = "lawyer"
        session[:lawyer_id] = @client.id
        
        redirect "/questions/all"
    end

    get "/login" do
        if !logged_in?
            erb :'users/login'
        else
            redirect "questions/all"
        end
    end

    post "/login" do
       
        session[:user_type] = params[:user_type]

        if params[:user_type] == "client"
            @client = Client.find_by(username: params[:username])
            if @client && @client.authenticate
                session[:client_id] = Client.find_by(username: params[:username]).id
            end
        elsif params[:user_type] == "client"
            @lawyer = Lawyer.find_by(username: params[:username])
            if @lawyer && @lawyer.authenticate
                session[:lawyer_id] = Lawyer.find_by(username: params[:username]).id
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
            redirect "/login"
        else
            redirect '/'
        end
    end
end