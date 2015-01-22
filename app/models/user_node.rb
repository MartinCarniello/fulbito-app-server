module UserNode
	
	def get_user_node_by_name(name)
    @neo = Neography::Rest.new
    @neo.get_node_index("users", "username", name)
  end

  def create_node(name)
    @neo = Neography::Rest.new
    user_node = @neo.create_node("username" => name)
    @neo.add_to_index("users", "username", name, user_node)
  end

  def add_friend(name, friend_name)
    @neo = Neography::Rest.new
    user_node = get_user_node_by_name(name)
    friend_node = get_user_node_by_name(friend_name)
    @neo.create_relationship("friends", user_node, friend_node)
    @neo.create_relationship("friends", friend_node, user_node)
  end

  def get_friends(name)
    @neo = Neography::Rest.new
    user_node = Neography::Node.load(get_user_node_by_name(name)[0]["self"])
    user_node.outgoing(:friends).map(&:username).inject([]) do |friends, friend_name|
      friends.push(User.find_by(username: friend_name))
      friends
    end
  end

end