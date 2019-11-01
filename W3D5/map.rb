class Map
    def initialize
        @map = []
    end

    def contains_key?(key)
        @map.any? {|pair| pair[0] == key}
    end

    def get_key_index(key)
        @map.each_with_index {|pair, i| return i if pair[0] == key}
    end

    def set(key, value)
        if !contains_key?(key)
            @map << [key, value]
        else
            @map[get_key_index(key)][1] = value
        end
    end

    def get(key)
        @map[get_key_index(key)][1] if contains_key?(key)
    end

    def delete(key)
        @map.delete_at(get_key_index(key)) if contains_key?(key)
    end

    def show
        p @map
    end
end