class UsersController < ApplicationController
  def new
    hashed_password = Digest::SHA2.hexdigest(SecureRandom.base64(8) + params[:password])
    date_parsed = Date.strptime(params[:birth_date], "%d/%m/%Y")
    user = User.new(username: params[:username], password: hashed_password, real_name: params[:real_name],
                                                            birth_date: date_parsed, position: params[:position])

    if !user.created?
      user.save
      user.create_node
      render json: Message.new("El usuario se ha creado exitosamente")
    else
      render json: Message.new("El usuario no se ha podido crear exitosamente")
    end
  end

  def show
    if(user = User.getUser(params[:username]))
      render json: user
    else
      render json: Message.new("El usuario no existe")
    end
  end

  def delete
    User.deleteUser(params[:username])
    render json: Message.new("El usuario #{params[:username]} ha sido eliminado")
  end

  def addFriend
    User.add_friend(params[:username], params[:friend_username])
    render json: Message.new("Los usuarios #{params[:username]} y #{params[:friend_username]} han sido relacionados como amigos")
  end

  def showFriends
    friends = User.get_friends(params[:username])
    render json: friends
  end
end