require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

#Author class test
chimamanda = Author.new("Chimamanda")
ngugi = Author.new("Ngugi")
achebe = Author.new("Achebe")

#Magazine class test
mens_health = Magazine.new("Mens Health", "Fitness")
vogue = Magazine.new("Vogue", "Entertainment")
runner = Magazine.new("Runner", "Sports")

#Articles class test
achebe.add_article(entertainment, "Entertainment industry in Nigeria making it big")
chimamanda.add_article(education, "Reading many books help you improve your language")
ngugi.add_article(politics, "Kenyans still vote along ethic groups")









### DO NOT REMOVE THIS
binding.pry

0
