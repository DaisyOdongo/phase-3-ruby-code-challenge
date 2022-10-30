class Author
  attr_accessor :name


  def initialize(name)
    @name = name
    @articles = []
    @magazines = []
    if name.is_a?(String)
      @name = name
    else
      puts "Expected name.class to be a String"
    end
  
  end


end
