class UserController < ApplicationController

    get "/signup/client" do
        erb :'users/signup_client'
    end

    get "/signup/lawyer" do
        erb :'users/signup_lawyer'
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
        erb :'users/login'
    end

    post "/login" do
        session[:user_type] = params[:user_type]
        
        if params[:user_type] == "client"
            session[:client_id] = Client.find_by(username: params[:username]).id
        else 
            session[:lawyer_id] = Lawyer.find_by(username: params[:username]).id
        end
        
        redirect "/questions/all"
    end

    

end