require "byebug"

FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2)
def sluggish_octopus
    longest_fish = ""
    FISHES.each do |fish1|
        FISHES.each do |fish2|
            if fish2.length > fish1.length
                longest_fish = fish2
            end
        end
    end
    longest_fish
end

# O(n log n)
def dominant_octopus(fishes)
    return fishes[0] if fishes.length == 1

    mid = fishes.length / 2
    longest_fish = ""
    fishes.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end

    left = dominant_octopus(fishes[0...mid])
    right = dominant_octopus(fishes[mid..-1])
    longest_fish > [left, right].max ? [left, right].max : longest_fish
end

# O(n)
def clever_octopus
    longest_fish = ""
    FISHES.each do |fish|
        longest_fish = fish if fish.length > longest_fish.length
    end
    longest_fish
end

p sluggish_octopus
p dominant_octopus(FISHES)
p clever_octopus

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
new_tiles_data_structure = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

# O(n)
def slow_dance(dir, tiles)
    tiles.each_with_index do |tile, i|
        return i if tile == dir
    end
    -1
end

def fast_dance(dir, tiles)
    tiles.each do |k, v|
        return v if k == dir
    end
    -1
end

p slow_dance("up", tiles_array)
# > 0

p slow_dance("right-down", tiles_array)
# > 3

p fast_dance("up", new_tiles_data_structure)
# > 0

p fast_dance("right-down", new_tiles_data_structure)
# > 3