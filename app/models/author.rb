class Author
  attr_accessor :name


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


end
