class UserController < ApplicationController

    get "/signup/client" do
        erb :'users/signup_client'
    end

    get "/signup/lawyer" do
        erb :'users/signup_lawyer'
    end

    post "/signup/client" do
        session[:user_type] = "client"
        redirect "/questions/all"
    end

    post "/signup/lawyer" do
        session[:user_type] = "lawyer"
        redirect "/questions/all"
    end

    get "/login" do
        erb :'users/login'
    end

    post "/login" do
        
        session[:user_type] = params[:user_type]
        redirect "/questions/all"
    end


end