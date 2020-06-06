require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  helpers do
    def user_is_a?
      session[:user_type] == "client" ? "client" : "lawyer"
    end

    def logged_in?
      if user_is_a? == "client" 
        !!session[:client_id]
      else
        !!session[:lawyer_id]
      end
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
