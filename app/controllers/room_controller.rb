class RoomController < ActionController::API

    def init
        params[:_json].each do |room|
            RoomInteractor::Create.new(
                name: room[:room], 
                m: room[:m], 
                n: room[:n], 
                furniture_count: room[:furniture_count], # This could be calculated in hte interactor
                furnitures: room[:furniture]
            ).call
        end

        render json: {status: 200, message: "Ok"}
    end


    def get_dead_ends
        room = Room.find_by(name: params[:room])
        
        if room != nil 
            result = CountDeadEnds.new(room).calculate
            render json: result
        else
            render json: {status: 404, message: "Room Not Found"}
        end
    end


    def get_all
        json = Room.all.map do |room|
            result = CountDeadEnds.new(room).calculate
            {room_name: room.name, dead_ends_count: result[0]}
        end

        render json: json
    end

end