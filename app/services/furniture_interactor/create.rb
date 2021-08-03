module FurnitureInteractor
    class Create
        def initialize(name:, start_p:, end_p:, room:)
            @name = name
            @start_p = start_p
            @end_p = end_p
            @room = room
        end

        def call
            Furniture.create!(
                name: name, 
                start_p: start_p,
                end_p: end_p,
                room: room
            )
        end

        private

        attr_reader :name, :start_p, :end_p, :room
    end
end