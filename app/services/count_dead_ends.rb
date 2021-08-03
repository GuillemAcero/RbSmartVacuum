# Class in charge of generating, populating and resolving a room
# populate_room updates the M*N 0-based matrix, putting 9s where the furniture is located
# calculate goes tile by tile checking if there's a valid path towards the exit (using helper functions skippeable_tile?, invalid_top?, ...)
class CountDeadEnds
    UNEXPLORED_VALUE = 0
    DEAD_END_VALUE = 1
    VALID_VALUE = 2
    FURNITURE_VALUE = 9

    def initialize(room)
        @room = room
        @matrix = Array.new(room.m) { Array.new(room.n) { 0 } }
    end

    def calculate
        populate_room

        dead_ends = 0

        (0..room.m-1).each do |row| 
            (0..room.n-1).reverse_each do |col| # Revers each because we want to start from the last column
                next if skipable_tile?(row, col)

                if invalid_top?(row, col) && invalid_right?(row, col)
                  @matrix[row][col] = DEAD_END_VALUE
                  dead_ends += 1
                  next
                end
                
                @matrix[row][col] = VALID_VALUE
            end
        end

        [dead_ends, @matrix]
    end


    private
    attr_reader :room

    def populate_room
        # Furniture population
        room.furniture.all.each do |furniture|
            (furniture.start_p[1].to_i..furniture.end_p[1].to_i).each do |row|
                (furniture.start_p[3].to_i..furniture.end_p[3].to_i).each do |col|
                    @matrix[row][col] = FURNITURE_VALUE
                end
            end
        end

        # Exit population
        @matrix[0][room.n-1] = VALID_VALUE
    end

    def skipable_tile?(row, col)
        (row == 0 && col == room.n-1) || (@matrix[row][col] == FURNITURE_VALUE)
    end

    def invalid_top?(row, col)
      row == 0 || @matrix[row-1][col].in?([DEAD_END_VALUE, FURNITURE_VALUE])
    end

    def invalid_right?(row, col)
      room.n-1 == col || @matrix[row][col+1].in?([DEAD_END_VALUE, FURNITURE_VALUE])
    end

end

