class HomeController < ApplicationController
  def index
  	@user = User.new
  end

  def login
  	username = params[:user][:username].downcase
  	user = User.find_by_name(username)
  	hashed_password = Digest::SHA2.hexdigest(params[:user][:password])
  	redirect_to :controller => 'dashboard', :action => 'index', :id => user.id
  end
end
