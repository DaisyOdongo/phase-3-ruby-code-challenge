# Please copy/paste all three classes into this file to submit your solution!
#Article class
class Article
    attr_reader :title
    @@all = []

    def initialize(author, magazine, title)
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

    def self.all
        @@all
    end
end


# Author Class
class Author
    attr_reader :name

    def initialize(name)
      @articles = []
      @magazines = []
      if name.is_a?(String)
        @name = name
      else
        puts "Expected name.class to be a String"
      end
    end

    def articles 
      @articles
    end

    def magazines
      @magazines.uniq
    end

    def add_article(magazine, title)
      if(magazine.is_a?(Magazine) && title.is_a?(String))
        @articles  << Article.new(self, magazine, title)
        @magazines << magazine
      else
        puts "Expected Magazine.class to be an Object, title.class to be a String"
      end
    end

    def topic_areas
      @magazines.map {|magazine| magazine.category}.uniq
    end
end


# Magazine Class
class Magazine
    attr_accessor :name, :category
    @@all = []

    def initialize(name, category)
      if (name.is_a?(String) && category.is_a?(String))
        @name = name
        @category = category
        @@all << self
      else
        puts "Expected name.class and category.class to be a String"
      end
    end

    def self.all
      @@all
    end

    def contributors
      articles_by_authors_in_this_magazine.map {|article| article.author}
    end

    def self.find_by_name(name)
      @@all.find {|magazine| magazine.name == name}
    end

    def article_titles
      articles_by_authors_in_this_magazine.map {|article| article.title}
    end

    def contributing_authors
      all_magazine_authors = articles_by_authors_in_this_magazine.map {|article| article.author}
      uniq_magazine_authors =  all_magazine_authors.uniq

      uniq_magazine_authors.filter {|author|  all_magazine_authors.count(author) > 2}
    end

    private
    def articles_by_authors_in_this_magazine
      Article.all.filter {|article| article.magazine == self}
    end
end
