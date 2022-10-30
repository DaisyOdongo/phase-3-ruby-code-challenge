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


end
