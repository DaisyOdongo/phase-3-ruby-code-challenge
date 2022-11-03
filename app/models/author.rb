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
