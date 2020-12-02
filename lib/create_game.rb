# puts 'Hello World'

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Newboard
  attr_accessor :array

  def initialize
    @array = %w[- - - - - - - - -]
  end

 def input_marker(_input = nil, _player = nil)
   @array[input.to_i - 1] = 'X' if player == 1
   @array[input.to_i - 1] = 'O' if player == 2
end













# class game
#     attr_accessor :
# end

# class Cinema

#   attr_accessor :name, :location, :movies
#   def initialize(name, location)
#     @name
#  = name
#     @location
#  = location
#     @movies
#  = []
#   end

#   def add_movie(movie)
#   @movies
#  << movie
#   movie.cinema = self
#     end

#     def to_s
#         puts http://self.name
#     end
# end

# class Movie
#   attr_accessor :title, :showtime, :cinema
#   @@all
#  = []
#   def initialize(title, showtime)
#     @title = title
#     @showtime
#  = showtime
#     @@all
#  << self
#   end
# end

# cobbie_hill = http://Cinema.new('Cobbie','Brooklyn')
# spiderman = http://Movie.new('Spidy',"9pm")
# cobbie_hill.add_movie(spiderman)
# spiderman2 = http://Movie.new('Spidy2',"11pm")
# cobbie_hill.add_movie(spiderman2)

#  cobbie_hill.movies
# puts cobbie_hill
