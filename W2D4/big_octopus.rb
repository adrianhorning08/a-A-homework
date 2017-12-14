require 'byebug'

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(fish)

  longest_word = ''
  i = 0
  while i < fish.length-1
    j = i+1
    while j < fish.length
      longest_word = fish[j] if fish[i].length < fish[j].length
      j+=1
    end
    i+=1
  end
  longest_word
end

def dominant(fish)
  merge(fish).last
end

def merge(fish)
  return fish if fish.length <= 1

  mid = fish.length/2

  left = merge(fish.take(mid))
  right = merge(fish.drop(mid))

  merge_helper(left,right)

end

def merge_helper(left,right)

  results = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      results << left.shift
    else
      results << right.shift
    end
  end

  results.concat(left)
  results.concat(right)
  results
end

def clever(fish)
    longest_length = 0
    longest_word = nil

    fish.each do |word|
      if word.length > longest_length
        longest_word = word
        longest_length = word.length
      end
    end
    longest_word
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]


def slow_dance(tile_direction,tiles_array)

  tiles_array.each_with_index do |tile,i|
    return i if tile == tile_direction
  end
end


def fast_dance(tile_direction)

  octupus = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  octupus[tile_direction]

end

p fast_dance("up")

p fast_dance("right-down")
