require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
    def remove_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        users = client[:users]
        users.delete_many({email: email})
    end

    def get_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        users = client[:users]
        user = users.find({email: email}).first
        return user[:_id]
    end

    def remove_equipo(name, email)
        user = get_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        equipos = client[:equipos]
        equipos.delete_many({name: name, user: user})
    end
end
