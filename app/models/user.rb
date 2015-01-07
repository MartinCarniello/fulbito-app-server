class User < ActiveRecord::Base
  def self.getUser(name)
    User.find_by(username: name)
  end

  def created?
    User.exists?(username: username)
  end

  def self.deleteUser(name)
    User.destroy_all(username: name)
  end

  def self.get_user_node(name)
    @neo = Neography::Rest.new
    @neo.get_node_index("users", "username", name)
  end

  def create_node
    @neo = Neography::Rest.new
    user_node = @neo.create_node("username" => username)
    @neo.add_to_index("users", "username", username, user_node)
  end

  def self.add_friend(name, friend_name)
    @neo = Neography::Rest.new
    user_node = get_user_node(name)
    friend_node = get_user_node(friend_name)
    @neo.create_relationship("friend", user_node, friend_node)
  end

  def self.get_friends(name)
    @neo = Neography::Rest.new
    user_node = get_user_node(name)
    @neo.get_node_relationships(user_node, "all", "friend").collect { |node| User.new(username: node) }
  end

end
