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

    def songs
        return Song.all.select {|i| i.artist == self}
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def genres
        @genres = []
        Song.all.collect do |song|
            if song.artist == self
                @genres << song.genre
            end
        end
        @genres
    end

end