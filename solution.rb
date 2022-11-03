# Please copy/paste all three classes into this file to submit your solution!
#Article class
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



# Author Class
class Author
  attr_reader :name

  def initialize(name)
  #Author is initialized with a name as a string  
    @name = name
    @articles = []
    @magazines = []
    if name.is_a?(String)
      @name = name
    else
      puts "Expected name.class to be a String"
    end
  end    

    def articles 
    Article.all.select {|article| article.author==self}
  end

  def magazines
     magazines = articles.map {|article| article.magazine}
     magazines.map {|magazine| magazine.name}.uniq
  end
end


# Magazine Class
class Magazine
   # The name and category of the magazine can be changed after being initialized.
  attr_accessor :name, :category
  @@all = []

  def initialize(name, category)
    # A magazine is initialized with a name as a string and a category as a string
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

  def contributors # Returns an array of Author instances who have written for this magazine
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

