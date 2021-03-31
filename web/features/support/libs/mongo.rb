require "mongo"

def create_folder_logs
  Dir.mkdir "logs" unless File.exists?("logs")
end

create_folder_logs

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :client, :users, :equipos

  def initialize
    @client = Mongo::Client.new(CONFIG["mongo"])
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def insert_users(data)
    @users.insert_many(data)
  end

  def drop_database
    @client.database.drop
  end

  def remove_user(email)
    @users.delete_many({email: email})
  end

  def get_user(email)
    user = @users.find({email: email}).first
    return user[:_id]
  end

  def remove_equipo(name, email)
    user = get_user(email)
    @equipos.delete_many({name: name, user: user})
  end
end
