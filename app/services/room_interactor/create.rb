module RoomInteractor
    class Create
        def initialize(name:, m:, n:, furniture_count:, furnitures:)
            @name = name
            @m = m
            @n = n 
            @furniture_count = furniture_count
            @furnitures = furnitures
        end

        def call
            room = Room.create!(
                name: name, 
                m: m, 
                n: n, 
                furniture_count: furniture_count
            )

            furnitures.each do |furniture|
                FurnitureInteractor::Create.new(
                    name: furniture[:name],
                    start_p: furniture[:start],
                    end_p: furniture[:end],
                    room: room
                ).call
            end

            room
        end

        private

        attr_reader :name, :m, :n, :furniture_count, :furnitures
    end
end