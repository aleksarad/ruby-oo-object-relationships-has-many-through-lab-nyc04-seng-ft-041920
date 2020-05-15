require_relative "song.rb"
require_relative "genre.rb"

class Artist
    attr_accessor :name 
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end 

    def songs
        Song.all.select {|song| song.artist ==  self}
    end

    def genres
        self.songs.collect {|song| song.genre}.uniq
    end
end

mimi = Artist.new("Mariah Carey")
pop = Genre.new("Pop")
rnb = Genre.new("R&B")

mimi.new_song("Caution", rnb)
mimi.new_song("Emotions", pop)
mimi.new_song("Vision of Love", pop)

pp pop.songs

# p mimi
# p Song.all
