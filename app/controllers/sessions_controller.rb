class SessionsController < ApplicationController

  #skip_authorization_check :only => [:new, :create, :destroy]

def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    #redirect_to root_url, :notice => "Logged in!"
    redirect_to arguments_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  session[:current_controller] = nil
  session[:current_project] = nil
  redirect_to root_url, :notice => "Logged out!"
end
  
end
