class User < ActiveRecord::Base
  extend UserNode

  def self.get_all
    User.all
  end

  def self.find_by_name(name)
    User.find_by(username: name)
  end

  def self.delete_user(name)
    User.destroy_all(username: name)
    @neo = Neography::Rest.new
    node = @neo.get_node_index("users", "username", name)
    @neo.delete_node(node)
  end

  def created?
    User.exists?(username: username)
  end

end
