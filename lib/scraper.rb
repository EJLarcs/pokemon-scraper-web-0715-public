require 'nokogiri'
#use nokogiri as this is a file as opposd to a webpage
require 'pry'

class Scraper

 @@pokemons = []
 #this is optional ... if you wish to collect all the instances of pokemon that you creates
 #here is an array and you can shovel in each instance when you've created it

 def initialize(db)
   @db = db
   #initialize the scraper with a database
 end

 def file
   html_doc = File.open('./pokemon_index.html')
   #assign the file content you wish to use to a variable
   Nokogiri::HTML(html_doc)
   #call nokogiri with HTML
   #pass the HTML an argument of the HTML you wish to search through
 end

 def scrape
   file.css('span.infocard-tall').each do |pokemon|
    #iterate over the specific area of content in your webpage
     pokename = pokemon.css('a.ent-name').text
    #scrape the information required for the variable: which in this case is the 'pokemon's name'
    #remember to call .text to ensure the object is a string
     poketype = pokemon.css('small.aside a').text
    #scrape the information required for the variable: which in this case is 'pokemon's type'
    #remember to call .text to ensure the object is a string
     new_pokemon = Pokemon.new(pokename, poketype, @db)
  #initialize a new pokemon class with the information scraped from the webpage
  #assign the new pokemon instance to a variable
     new_pokemon.save
  #call save on the new pokemon instance you've created
   end
 end
end
