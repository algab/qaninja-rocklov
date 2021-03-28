require_relative "base_api"

class Equipos < BaseAPI
    def create(payload, user_id)        
        return self.class.post(
            "/equipos", 
            body: payload,
            headers: {
                "user_id": user_id
            }
        )
    end
end
