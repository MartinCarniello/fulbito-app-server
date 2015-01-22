class UsersController < ApplicationController
  def index
    render json: User.get_all
  end

  def show
    if(user = User.where(id: params[:id]))
      render json: user
    else
      render json: Message.new("El usuario no existe")
    end
  end

  def get
    if(user = User.find_by_name(params[:username]))
      render json: user
    else
      render json: Message.new("El usuario no existe")
    end
  end

  def destroy
    User.delete_user(params[:username])
    render json: Message.new("El usuario #{params[:username]} ha sido eliminado")
  end

  def search
    username = params[:username].downcase
    render json: User.where("username like ?", "%#{username}%")
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