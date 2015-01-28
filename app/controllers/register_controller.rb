class RegisterController < ApplicationController
  def index
  	@user = User.new
  	@positions = ["arquero", "def lateral", "def central",
				  "med defensivo", "med lateral", "med ofensivo",
				  "del central", "del lateral"]
  end

  def create
  	username = params[:user][:username].downcase
  	password = params[:user][:password]
  	confirm_password = params[:user][:confirm_password]
  	real_name = params[:user][:real_name].split(" ").map(&:capitalize).join(" ")
  	birth_date = Date.strptime(params[:user][:birth_date], "%d/%m/%Y")
  	position = params[:user][:position]

    hashed_password = Digest::SHA2.hexdigest(password)
    @user = User.new(username: username, password: hashed_password, real_name: real_name,
                                                            birth_date: birth_date, position: position)

    if !@user.created?
      if password == confirm_password
        if @user.save
          User.create_node(@user.username)
          flash[:success] = "El usuario ha sido creado correctamente"
        else
          flash[:danger] = "El usuario no se ha podido crear correctamente"
        end
      end
    else
      flash[:danger] = "El usuario ya existe"
    end    	
    
    redirect_to "/home/index"
  end
end
