require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if !logged_in?
      erb :index
    else
      redirect "/questions/all"
    end
  end

  helpers do
    def user_is_a?
      session[:user_type] == "client" ? "client" : "lawyer"
    end

    def logged_in?
       !!session[:client_id] || !!session[:lawyer_id]
    end
  
    def current_user
      if user_is_a? == "client" 
        Client.find(session[:client_id])
      else
        Lawyer.find(session[:lawyer_id])
      end
    end
  end
end
