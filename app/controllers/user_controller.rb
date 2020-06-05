class UserController < ApplicationController

    get "/signup/client" do
        erb :'users/signup_client'
    end

    get "/signup/lawyer" do
        erb :'users/signup_lawyer'
    end

    post "/signup/client" do
        "You are signed up!"
    end

    post "/signup/lawyer" do
        binding.pry
    end
end