class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :categories
  def categories
  	@categories = Category.all
  end

  def signin
    @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect_to '/users/' + @user.id.to_s
  else
    flash[:alert] = "username/password combination does not exist"
    redirect_to '/'
  end
  end

  def signout
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def current_user
  	begin
  		@current_user = session[:user_id] && User.find(session[:user_id])
  	rescue
  		puts "session[:user_id] error (#{session[:user_id]})"
  		session[:user_id] = nil
  	end
  end
end

