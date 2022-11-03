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
