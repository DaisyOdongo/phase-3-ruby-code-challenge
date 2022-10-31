class Article
     attr_reader :title #An article **cannot** change its author, magazine, or title after it is has been initialized.
    @@all = []
    def initialize(author, magazine, title)    # An article is initialized with an author as an Author object, a magazine as a Magazine object, and title as a string.
        if(author.is_a?(Author) && magazine.is_a?(Magazine) && title.is_a?(String))
            @author = author
            @magazine = magazine
            @title = title
            @@all << self
        else 
            puts "Expected author and magazine to be objects, title to be a string"
        end    
    end

    def author
        @author
    end

    def magazine
        @magazine
    end

    # Returns an array of all Article instances
    def self.all
        @@all
    end



end
