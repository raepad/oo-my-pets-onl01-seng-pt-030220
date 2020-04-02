require 'pry'

class Owner
  attr_accessor :dog, :cat
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def say_species
    "I am a #{species}."
  end
  
  def self.count
    Owner.all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select do |cat| 
      cat.owner == self
    end
  end
  
  def dogs 
    Dog.all.select do |dog| 
      dog.owner == self
    end
  end
  
  def buy_cat(name)
    name = Cat.new(name, self)
  end
 
  def buy_dog(name)
    name = Dog.new(name, self)
  end
  
  def walk_dogs
    dogs.each {|d| d.mood = "happy"}
  end
  
  def feed_cats
    cats.each {|c| c.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each {|sell| sell.mood = "nervous"}
    self.cats.each do |cat| 
      cat.owner = nil
    end
    
    self.dogs.each {|sell| sell.mood = "nervous"}
    self.dogs.each do |dog| 
      dog.owner = nil
    end
  end
    
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end